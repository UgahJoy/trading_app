import 'package:flutter/material.dart';
import 'package:trading_app/theme/colors.dart';

class AnimatedTextWidget extends StatefulWidget {
  final String text;
  final double targetSize; // the desired size (0 = shrink)

  const AnimatedTextWidget({
    super.key,
    required this.text,
    required this.targetSize,
  });

  @override
  createState() => _AnimatedTextWidgetState();
}

class _AnimatedTextWidgetState extends State<AnimatedTextWidget> {
  double _currentSize = 0;

  @override
  void didUpdateWidget(covariant AnimatedTextWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.targetSize != oldWidget.targetSize) {
      setState(() {
        _currentSize = widget.targetSize == 0 ? _currentSize : 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(
        begin: _currentSize,
        end: widget.targetSize == 0 ? 0 : widget.targetSize,
      ),
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
      builder: (context, value, child) {
        return Text(
          widget.text,
          style: TextStyle(
            fontSize: value,
            color: AppColors.primaryColor,
            fontWeight: FontWeight.w700,
          ),
        );
      },
      onEnd: () {
        _currentSize = widget.targetSize;
      },
    );
  }
}
