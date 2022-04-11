import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
// import 'package:keyboard_actions/external/platform_check/platform_check.dart';

/// 图片加载（支持本地与网络图片）
class LoadImage extends StatelessWidget {
  const LoadImage(
    this.image, {
    Key? key,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.format = 'png',
    this.holderImg = 'none',
    this.cacheWidth,
    this.cacheHeight,
  }) : super(key: key);

  final String? image;
  final double? width;
  final double? height;
  final BoxFit fit;
  final String format;
  final String holderImg;
  final int? cacheWidth;
  final int? cacheHeight;

  @override
  Widget build(BuildContext context) {
    var imageUrl ='';
    image != null ? imageUrl = image! : imageUrl = '';
    // var image = imageUrl ?? '';
    if (imageUrl.isEmpty ||
        imageUrl.startsWith('http') ||
        imageUrl.startsWith('https')) {
      if (Platform.isFuchsia) {
        // print('image: ~~~~~~~~~~~~~ $image');
        return FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          image: imageUrl,
        );
      } else {
        final Widget _image =
            LoadAssetImage(holderImg, height: height, width: width, fit: fit);
        return CachedNetworkImage(
          imageUrl: imageUrl,
          placeholder: (_, __) => _image,
          errorWidget: (_, __, dynamic error) => _image,
          width: width,
          height: height,
          fit: fit,
          memCacheWidth: cacheWidth,
          memCacheHeight: cacheHeight,
        );
      }
    } else {
      return LoadAssetImage(
        imageUrl,
        height: height,
        width: width,
        fit: fit,
        format: format,
        cacheWidth: cacheWidth,
        cacheHeight: cacheHeight,
      );
    }
  }

  static String getFullPath(String image, {String format = 'png'}) {
    if (!image.contains("/")) {
      image = "assets/images/" + image;
    }
    if (!image.contains(".")) {
      image = image + "." + format;
    }
    // print('image: $image');
    return image;
  }

  static ImageProvider getImageProvider(String imageUrl,
      {String holderImg = 'none'}) {
    // print('imageUrl: ${imageUrl}');
    if (imageUrl.isEmpty) {
      return AssetImage(getFullPath(holderImg));
    }
    if (imageUrl.startsWith('http')) {
      return CachedNetworkImageProvider(imageUrl);
    } else {
      return AssetImage(getFullPath(imageUrl));
    }
  }

  static Widget circleAvatar(String url, double radius,
      {holderImg='placeholder.png'}) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.transparent,
      foregroundImage: getImageProvider(url, holderImg: holderImg),
      backgroundImage: getImageProvider(holderImg),
    );
  }
}

/// 加载本地资源图片
class LoadAssetImage extends StatelessWidget {
  LoadAssetImage(this.image,
      {Key? key,
      this.width,
      this.height,
      this.cacheWidth,
      this.cacheHeight,
      this.fit = BoxFit.cover,
      this.format = 'png',
      this.color})
      : super(key: key);

  final String image;
  final double? width;
  final double? height;
  final int? cacheWidth;
  final int? cacheHeight;
  final BoxFit fit;
  final String format;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      LoadImage.getFullPath(image, format: format),
      height: height,
      width: width,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
      fit: fit,
      color: color,

      /// 忽略图片语义
      excludeFromSemantics: true,
    );
  }
}
