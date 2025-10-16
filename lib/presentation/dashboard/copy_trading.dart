import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trading_app/shared_widgets/app_scaffold.dart';

class CopyTrading extends ConsumerStatefulWidget {
  const CopyTrading({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CopyTradingState();
}

class _CopyTradingState extends ConsumerState<CopyTrading> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(body: Column(children: [
        
      ],
    ));
  }
}
