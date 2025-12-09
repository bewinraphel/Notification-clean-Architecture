import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class OptimizedImage extends StatelessWidget {
  final String url;
  final double size;
  final BoxFit fit;
  final Widget? placeholder;

  const OptimizedImage({
    super.key,
    required this.url,
    this.size = 30,
    this.fit = BoxFit.contain,
    this.placeholder,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      height: size,
      width: size,
      fit: fit,
      placeholder: (_, __) => placeholder ??
          Container(
            height: size,
            width: size,
            color: Colors.grey.shade200,
          ),

      errorWidget: (_, __, ___) => Icon(
        Icons.broken_image_rounded,
        color: Colors.grey,
        size: size,
      ),
      memCacheHeight: 80,  
      memCacheWidth: 80,
    );
  }
}
