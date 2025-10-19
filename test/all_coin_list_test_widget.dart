import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trading_app/presentation/home/widget/all_coins_list.dart';
import 'package:trading_app/shared_state/app_state.dart';
import 'package:trading_app/repositories/global_repository.dart';
import 'package:trading_app/models/all_coin_model.dart';

class MockGlobalRepository extends Fake {
  Future<void> fetchAllCoins() async {}
}

final mockAllCoins = [
  AllCoinModel(
    name: 'Bitcoin',
    symbol: 'BTC',
    currentPrice: 30000.00,
    priceChangePercentage24H: 2.5,
    image: 'https://bitcoin.org/img/icons/opengraph.png',
  ),
  AllCoinModel(
    name: 'Ethereum',
    symbol: 'ETH',
    currentPrice: 1800.00,
    priceChangePercentage24H: -1.2,
    image: 'https://ethereum.org/images/logos/ETHEREUM-ICON_Black.png',
  ),
];

void main() {
  testWidgets('AllCoinList shows loader when busy, then displays list', (
    tester,
  ) async {
    final container = ProviderContainer(
      overrides: [
        globalRepository.overrideWith((ref) => GlobalRepository(ref)),
        appState.overrideWith((ref) => AppState(ref)..allCoins = []),
      ],
    );

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: const MaterialApp(home: Scaffold(body: AllCoinList())),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    container.read(appState.notifier).allCoins = mockAllCoins;
    await tester.pumpAndSettle();

    expect(find.text('Bitcoin'), findsOneWidget);
    expect(find.text('Ethereum'), findsOneWidget);
  });
}
