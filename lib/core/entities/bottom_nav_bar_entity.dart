import 'package:flutter/material.dart';
import 'package:medi_link/core/utils/assets.dart';
import 'package:medi_link/generated/l10n.dart';

class BottomNavBarEntity {
  final String activeImage;
  final String inActiveImage;
  final String name;

  BottomNavBarEntity({
    required this.activeImage,
    required this.inActiveImage,
    required this.name,
  });
}

List<BottomNavBarEntity> bottomNavBarItems(BuildContext context){
  return [
    BottomNavBarEntity(
      inActiveImage: Assets.assetsImagesHomeInactiveIcon,
      activeImage: Assets.assetsImagesHomeActive,
      name: S.of(context).home,
    ),
    BottomNavBarEntity(
      inActiveImage: Assets.assetsImagesBookingInactive,
      activeImage: Assets.assetsImagesBookingIcon,
      name: S.of(context).bookings,
    ),
    BottomNavBarEntity(
      inActiveImage: Assets.assetsImagesHomeInactiveIcon,
      activeImage: Assets.assetsImagesHomeActive,
      name: S.of(context).home,
    ),
    BottomNavBarEntity(
      inActiveImage: Assets.assetsImagesBookingInactive,
      activeImage: Assets.assetsImagesBookingIcon,
      name: S.of(context).bookings,
    ),
  ];
}
