import 'package:flutter/material.dart';

enum ImageSourceType { asset, network }

class ImageSource {
  final String path;

  final ImageSourceType type;

  const ImageSource._(this.path, this.type);

  factory ImageSource.asset(String path) {
    return ImageSource._(path, ImageSourceType.asset);
  }

  factory ImageSource.network(String url) {
    return ImageSource._(url, ImageSourceType.network);
  }

  ImageProvider get imageProvider {
    switch (type) {
      case ImageSourceType.asset:
        return AssetImage(path);
      case ImageSourceType.network:
        return NetworkImage(path);
    }
  }

  @override
  String toString() {
    return 'ImageSource(path: $path, type: $type)';
  }
}
