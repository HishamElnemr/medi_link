import 'package:medi_link/core/utils/assets.dart';

class BottomNavBarEntity {
  final String activeImage;
  final String inActiveImage;

  BottomNavBarEntity({required this.activeImage, required this.inActiveImage});
}

List<BottomNavBarEntity> bottomNavBarItems() {
  return [
    BottomNavBarEntity(
      inActiveImage: Assets.assetsImagesHomeInactiveIcon,
      activeImage: Assets.assetsImagesHomeActive,
    ),
    BottomNavBarEntity(
      inActiveImage: Assets.assetsImagesBookingInactive,
      activeImage: Assets.assetsImagesBookingIcon,
    ),
    BottomNavBarEntity(
      inActiveImage: Assets.assetsImagesFavInactive,
      activeImage: Assets.assetsImagesFavActive,
    ),
    BottomNavBarEntity(
      inActiveImage: Assets.assetsImagesProfileInctive,
      activeImage: Assets.assetsImagesProfileActive,
    ),
  ];
}
