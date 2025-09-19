import 'package:medi_link/core/utils/assets.dart';

class SpecialityModel {
  final String icon;
  final String titleKey;
  final String rawName;

  SpecialityModel({
    required this.icon,
    required this.titleKey,
    required this.rawName,
  });
}

final List<SpecialityModel> specialtiesList = [
  SpecialityModel(
    icon: Assets.assetsImagesCadiologist,
    titleKey: 'cardiology',
    rawName: 'cardiology',
  ),
  SpecialityModel(
    icon: Assets.assetsImagesDentists,
    titleKey: 'dentistry',
    rawName: 'dentistry',
  ),
  SpecialityModel(
    icon: Assets.assetsImagesNephrologists,
    titleKey: 'nephrology',
    rawName: 'nephrology',
  ),
  SpecialityModel(
    icon: Assets.assetsImagesGastroenterologists,
    titleKey: 'internal_medicine',
    rawName: 'internal_medicine',
  ),
  SpecialityModel(
    icon: Assets.assetsImagesPulmonologists,
    titleKey: 'pulmonology',
    rawName: 'pulmonology',
  ),
  SpecialityModel(
    icon: Assets.assetsImagesPsychiatrists,
    titleKey: 'psychiatry',
    rawName: 'psychiatry',
  ),
  SpecialityModel(
    icon: Assets.assetsImagesHepatologists,
    titleKey: 'liver',
    rawName: 'liver',
  ),
];
