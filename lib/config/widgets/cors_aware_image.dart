import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

/// Виджет для загрузки изображений с поддержкой CORS на веб-платформе
/// На веб использует Image.network (лучше работает с CORS)
/// На мобильных платформах использует CachedNetworkImage
class CorsAwareImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Widget? placeholder;
  final Widget Function(BuildContext, String, dynamic)? errorWidget;
  final Map<String, String>? httpHeaders;

  const CorsAwareImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.placeholder,
    this.errorWidget,
    this.httpHeaders,
  });

  @override
  Widget build(BuildContext context) {
    // На веб-платформе используем Image.network для лучшей поддержки CORS
    if (kIsWeb) {
      return _buildWebImage(context);
    } else {
      // На мобильных платформах используем CachedNetworkImage
      return _buildMobileImage(context);
    }
  }

  Widget _buildWebImage(BuildContext context) {
    return Image.network(
      imageUrl,
      width: width,
      height: height,
      fit: fit,
      headers: httpHeaders,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return placeholder ??
            SizedBox(
              width: width,
              height: height,
              child: Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
              ),
            );
      },
      errorBuilder: (context, error, stackTrace) {
        if (errorWidget != null) {
          return errorWidget!(context, imageUrl, error);
        }
        return Container(
          width: width,
          height: height,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.red.shade50,
            border: Border.all(color: Colors.red.shade200),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error, color: Colors.red),
              const SizedBox(height: 8),
              const Text(
                'Изображение не загружено',
                style: TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMobileImage(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit,
      httpHeaders: httpHeaders,
      placeholder: placeholder != null
          ? (context, url) => placeholder!
          : null,
      progressIndicatorBuilder: placeholder != null
          ? null
          : (context, url, loadingProgress) {
              return SizedBox(
                width: width,
                height: height,
                child: Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.progress != null
                        ? loadingProgress.progress
                        : null,
                  ),
                ),
              );
            },
      errorWidget: errorWidget ??
          (context, url, error) {
            return Container(
              width: width,
              height: height,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                border: Border.all(color: Colors.red.shade200),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error, color: Colors.red),
                  const SizedBox(height: 8),
                  const Text(
                    'Изображение не загружено',
                    style: TextStyle(fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          },
    );
  }
}

