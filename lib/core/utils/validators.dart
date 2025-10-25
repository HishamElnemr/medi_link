import 'package:flutter/material.dart';
import 'package:medi_link/generated/l10n.dart';

class Validators {
  static final RegExp _emailRegExp = RegExp(
    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@"
    r'[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?'
    r'(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$',
  );

  static String? validateEmail(BuildContext context, String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'هذا الحقل مطلوب';
    }
    final v = value.trim();
    if (!_emailRegExp.hasMatch(v)) {
      return 'صيغة البريد الإلكتروني غير صحيحة';
    }
    return null;
  }

  static String? validatePassword(
    BuildContext context,
    String? value, {
    int minLength = 8,
  }) {
    if (value == null || value.isEmpty) {
      return 'هذا الحقل مطلوب';
    }
    if (value.length < minLength) {
      return 'كلمة المرور يجب أن تكون ${minLength} أحرف على الأقل';
    }
    return null;
  }

  static String? validateAge(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return S.of(context).this_field_is_required;
    }
    final int? age = int.tryParse(value);
    if (age == null || age < 1 || age > 199) {
      return S.of(context).invalid_age;
    }
    return null;
  }
}
