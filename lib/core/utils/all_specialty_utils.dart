import 'package:flutter/material.dart';
import 'package:medi_link/core/utils/assets.dart';
import 'package:medi_link/features/home/data/models/speciality_model.dart';
import 'package:medi_link/generated/l10n.dart';

class AllSpecialtyUtils {
  static const List<String> specialtyKeys = [
    'internal_medicine',
    'surgery',
    'pediatrics',
    'gynecology',
    'orthopedics',
    'dermatology',
    'ophthalmology',
    'cardiology',
    'neurology',
    'psychiatry',
    'dentistry',
    'ent',
    'urology',
    'nephrology',
    'oncology',
    'radiology',
    'anesthesia',
    'icu',
    'emergency',
    'endocrinology',
    'rheumatology',
    'gastroenterology',
    'pulmonology',
  ];

  static String getLocalizedSpecialty(
    BuildContext context,
    String specialtyKey,
  ) {
    final s = S.of(context);
    final specialtyMap = {
      'internal_medicine': s.internal_medicine,
      'surgery': s.surgery,
      'pediatrics': s.pediatrics,
      'gynecology': s.gynecology,
      'orthopedics': s.orthopedics,
      'dermatology': s.dermatology,
      'ophthalmology': s.ophthalmology,
      'cardiology': s.cardiology,
      'neurology': s.neurology,
      'psychiatry': s.psychiatry,
      'dentistry': s.dentistry,
      'ent': s.ent,
      'liver': s.liver,
      'urology': s.urology,
      'nephrology': s.nephrology,
      'oncology': s.oncology,
      'radiology': s.radiology,
      'anesthesia': s.anesthesia,
      'icu': s.icu,
      'emergency': s.emergency,
      'endocrinology': s.endocrinology,
      'rheumatology': s.rheumatology,
      'gastroenterology': s.gastroenterology,
      'pulmonology': s.pulmonology,
    };

    return specialtyMap[specialtyKey] ?? specialtyKey;
  }

  static String _getSpecialtyIcon(String specialtyKey) {
    switch (specialtyKey) {
      case 'cardiology':
        return Assets.assetsImagesCadiologist;
      case 'dentistry':
        return Assets.assetsImagesDentists;
      case 'nephrology':
        return Assets.assetsImagesNephrologists;
      case 'gastroenterology':
        return Assets.assetsImagesGastroenterologists;
      case 'pulmonology':
        return Assets.assetsImagesPulmonologists;
      case 'psychiatry':
        return Assets.assetsImagesPsychiatrists;
      case 'neurology':
        return Assets.assetsImagesNeurologists;
      case 'internal_medicine':
        return Assets.assetsImagesHepatologists;
      default:
        return Assets.assetsImagesHepatologists;
    }
  }

  static final List<SpecialityModel> allSpecialtiesList = specialtyKeys.map((key) {
    return SpecialityModel(
      icon: _getSpecialtyIcon(key),
      titleKey: key,
      rawName: key,
    );
  }).toList();
}
