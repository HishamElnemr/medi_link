import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:medi_link/core/constants/app_colors.dart';
import 'package:medi_link/core/utils/assets.dart';

class CachedNetworkImageWidget extends StatelessWidget {
  const CachedNetworkImageWidget({
    super.key,
    required this.imageUrl,
    this.height,
    this.width,
  });
  final double? height;
  final double? width;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,

      placeholder: (context, url) => Container(
        width: width ?? 60,
        height: height ?? 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey[300], // لون مؤقت أثناء التحميل
        ),
        child: const Icon(Icons.person, color: Colors.grey), // أيقونة default
      ),
      errorWidget: (context, url, error) => Container(
        width: width ?? 60,
        height: height ?? 60,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage(Assets.assetsImagesDoctor), // fallback نهائي
            fit: BoxFit.cover,
          ),
        ),
      ),
      imageBuilder: (context, imageProvider) => Container(
        width: width ?? 60,
        height: height ?? 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.softBlue1, width: 1),
          image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
