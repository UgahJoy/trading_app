import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/helper_files/constants.dart';
import 'package:trading_app/helper_files/extensions.dart';
import 'package:trading_app/helper_files/helper_function.dart';
import 'package:trading_app/models/all_coin_model.dart';
import 'package:trading_app/repositories/global_repository.dart';
import 'package:trading_app/shared_state/app_state.dart';
import 'package:trading_app/shared_widgets/app_border_container.dart';
import 'package:trading_app/shared_widgets/app_loader.dart';
import 'package:trading_app/shared_widgets/app_net_work_image.dart';
import 'package:trading_app/shared_widgets/empty_state_widget.dart';
import 'package:trading_app/theme/app_textstyle.dart';
import 'package:trading_app/theme/colors.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class AllCoinList extends ConsumerStatefulWidget {
  const AllCoinList({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AllCoinListState();
}

class _AllCoinListState extends ConsumerState<AllCoinList> {
  bool isBusy = true;
  @override
  void initState() {
    isBusy = ref.read(appState).allCoins.isEmpty;

    if (isBusy) {
      ref.read(globalRepository).fetchAllCoins().then((val) {
        isBusy = false;
        if (mounted) {
          setState(() {});
        }
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var allCoins = ref.watch(appState).allCoins;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Text(
                "Listed Coins",
                style: header2.copyWith(color: AppColors.iconGrey),
              ),
              Spacer(),
              Text(
                "See all",
                style: TextStyle(
                  color: AppColors.indicatorBlue,
                  fontFamily: "Nexa",
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
        Gap(8),
        AppBorderContainer(
          horizontalMargin: 16,
          verticalPadding: 0,
          horizontalPadding: 0,
          child: isBusy
              ? AppLoader()
              : allCoins.isEmpty
              ? Center(child: EmptyStateWidget())
              : AllRetrivedCoins(model: allCoins),
        ),
      ],
    );
  }
}

class CoinItems extends StatelessWidget {
  final AllCoinModel model;

  const CoinItems({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenPaddding, vertical: 12),
      child: Row(
        children: [
          AppNetWorkImage(
            fallBackAssetImage: "assets/roqque.png",
            imageUrl: model.image ?? "",
            height: 32,
            width: 32,
          ),
          Gap(20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.name ?? "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: header2.copyWith(fontSize: 15),
                ),
                Gap(4),
                Text((model.symbol ?? "").toUpperCase()),
              ],
            ),
          ),
          Gap(20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "\$${formatNumbers(model.currentPrice, formateForm: "#,##0.000")}",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: header2.copyWith(fontSize: 15),
              ),
              Gap(4),
              Text(
                textAlign: TextAlign.end,
                "${getPnLValue2((model.priceChangePercentage24H ?? 0))}%",
                style: TextStyle(
                  color: getPnLColor(model.priceChangePercentage24H ?? 0),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AllRetrivedCoins extends ConsumerStatefulWidget {
  final List<AllCoinModel> model;
  const AllRetrivedCoins({super.key, required this.model});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AllRetrivedCoinsState();
}

class _AllRetrivedCoinsState extends ConsumerState<AllRetrivedCoins> {
  WebSocketChannel? _channel;
  StreamSubscription? _connectivitySub;
  String _status = "Connecting...";
  bool _isConnected = false;
  int _reconnectAttempts = 0;
  Map<String, AllCoinModel> coinData = {};
  bool _isDisposing = false;

  late Map<String, Object> subscribeMessage;
  late Timer? _uiUpdateTimer;
  @override
  void initState() {
    for (var data in widget.model) {
      coinData[data.symbol ?? ""] = data;
    }
    subscribeMessage = {
      "method": "SUBSCRIBE",
      "params": widget.model.map((e) => "${e.symbol}usdt@ticker").toList(),
      "id": 1,
    };
    super.initState();
    _connectToSocket();
    _monitorConnectivity();
    _startUIUpdateTimer();
  }

  void _startUIUpdateTimer() {
    _uiUpdateTimer = Timer.periodic(const Duration(milliseconds: 2000), (
      timer,
    ) {
      refreshState();
    });
  }

  void _connectToSocket() {
    try {
      _channel = WebSocketChannel.connect(
        Uri.parse('wss://stream.binance.com/stream'),
      );

      _channel!.sink.add(jsonEncode(subscribeMessage));

      _channel!.stream.listen(
        (message) {
          _isConnected = true;
          _reconnectAttempts = 0;
          var singleCoinValue = jsonDecode(message)["data"];
          if (singleCoinValue == null) {
            return;
          }
          String coinSymbol = singleCoinValue["s"]
              .toString()
              .toLowerCase()
              .replaceAll("usdt", "");
          if (coinData.containsKey(coinSymbol)) {
            coinData[coinSymbol]!.currentPrice = singleCoinValue['c']
                .toString()
                .toDouble();
            coinData[coinSymbol]!.priceChangePercentage24H =
                singleCoinValue['P'].toString().toDouble();
          }
        },
        onError: (error) {
          _isConnected = false;
          _status = "Error: $error";
          log(_status);
          refreshState();
          _scheduleReconnect();
        },
        onDone: () {
          _isConnected = false;
          refreshState();
          _scheduleReconnect();
        },
        cancelOnError: true,
      );
    } catch (e) {
      _status = "Exception: $e";
      log(_status);
      refreshState();
      _scheduleReconnect();
    }
  }

  void refreshState() {
    if (mounted && !_isDisposing) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 0),
      shrinkWrap: true,
      itemCount: coinData.length,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => Column(
        children: [
          index == 0 ? Gap(8) : Gap(0),
          CoinItems(model: coinData.values.toList()[index]),
          index == coinData.length - 1 ? SizedBox() : Divider(),
        ],
      ),
    );
  }

  void _scheduleReconnect() {
    if (_isDisposing) {
      return;
    }
    _reconnectAttempts++;
    if (_reconnectAttempts >= 25) {
      _reconnectAttempts = 15;
    }
    final delay = Duration(seconds: 2 * _reconnectAttempts);
    _status = "Reconnecting in ${delay.inSeconds}s...";
    log(_status);
    refreshState();

    Future.delayed(delay, () {
      if (!_isConnected) _connectToSocket();
    });
  }

  @override
  void dispose() {
    _isDisposing = true;
    _connectivitySub?.cancel();
    _channel?.sink.close();
    _uiUpdateTimer?.cancel();
    super.dispose();
  }

  void _monitorConnectivity() {
    _connectivitySub = Connectivity().onConnectivityChanged.listen((result) {
      final hasNetwork = result.isNotEmpty;
      if (hasNetwork && !_isConnected) {
        _connectToSocket();
      }
    });
  }
}
