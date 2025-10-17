// ignore_for_file: use_super_parameters

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AppNetWorkImage extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? scale;
  final double? width;
  final BorderRadius? borderRadius;
  final String fallBackAssetImage;
  final BoxFit fit;

  const AppNetWorkImage({
    required this.imageUrl,
    this.borderRadius,
    this.scale,
    this.fallBackAssetImage = "assets/pro_trader_image.png",
    this.height = 21,
    this.fit = BoxFit.cover,
    this.width = 18,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(100),
      child: Transform.scale(
        scale: scale ?? 1,
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          height: height,
          width: width,
          fit: fit,
          errorWidget: (context, error, stackTrace) {
            return Image.asset(
              fallBackAssetImage,
              height: height,
              width: width,
              fit: fit,
            );
          },
          placeholder: (context, url) {
            return Image.asset(fallBackAssetImage, fit: fit);
          },
        ),
      ),
    );
  }
}
