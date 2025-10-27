import 'package:flutter/material.dart';
import 'package:medi_link/generated/l10n.dart';

String getLocalizedSpecialtyTitle(BuildContext context, String key) {
  switch (key) {
    case 'cardiology':
      return S.of(context).cardiology;
    case 'dentistry':
      return S.of(context).dentistry;
    case 'nephrology':
      return S.of(context).nephrology;
    case 'internal_medicine':
      return S.of(context).internal_medicine;
    case 'pulmonology':
      return S.of(context).pulmonology;
    case 'psychiatry':
      return S.of(context).psychiatry;
    case 'liver':
      return S.of(context).liver;
    case 'pediatrics':
      return S.of(context).pediatrics;
    default:
      return key;
  }
}
