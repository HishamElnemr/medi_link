// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Hello`
  String get hello {
    return Intl.message('Hello', name: 'hello', desc: '', args: []);
  }

  /// `Welcome`
  String get welcome {
    return Intl.message('Welcome', name: 'welcome', desc: '', args: []);
  }

  /// `Change Language`
  String get change_language {
    return Intl.message(
      'Change Language',
      name: 'change_language',
      desc: '',
      args: [],
    );
  }

  /// `MediLink`
  String get MediLink {
    return Intl.message('MediLink', name: 'MediLink', desc: '', args: []);
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Don't have an account?`
  String get dont_have_account {
    return Intl.message(
      'Don\'t have an account?',
      name: 'dont_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get sign_up {
    return Intl.message('Sign Up', name: 'sign_up', desc: '', args: []);
  }

  /// `Have an account?`
  String get have_account {
    return Intl.message(
      'Have an account?',
      name: 'have_account',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with Google`
  String get sign_in_with_google {
    return Intl.message(
      'Sign in with Google',
      name: 'sign_in_with_google',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with Facebook`
  String get sign_in_with_facebook {
    return Intl.message(
      'Sign in with Facebook',
      name: 'sign_in_with_facebook',
      desc: '',
      args: [],
    );
  }

  /// `User Name`
  String get user_name {
    return Intl.message('User Name', name: 'user_name', desc: '', args: []);
  }

  /// `First Name`
  String get first_name {
    return Intl.message('First Name', name: 'first_name', desc: '', args: []);
  }

  /// `Last Name`
  String get last_name {
    return Intl.message('Last Name', name: 'last_name', desc: '', args: []);
  }

  /// `Create New Account`
  String get create_new_account {
    return Intl.message(
      'Create New Account',
      name: 'create_new_account',
      desc: '',
      args: [],
    );
  }

  /// `Account created successfully`
  String get account_created_successfully {
    return Intl.message(
      'Account created successfully',
      name: 'account_created_successfully',
      desc: '',
      args: [],
    );
  }

  /// `This field is required`
  String get this_field_is_required {
    return Intl.message(
      'This field is required',
      name: 'this_field_is_required',
      desc: '',
      args: [],
    );
  }

  /// `Length should be more than 8`
  String get length_should_be_more_than_8 {
    return Intl.message(
      'Length should be more than 8',
      name: 'length_should_be_more_than_8',
      desc: '',
      args: [],
    );
  }

  /// `Sign in as`
  String get sign_as {
    return Intl.message('Sign in as', name: 'sign_as', desc: '', args: []);
  }

  /// `Patient`
  String get patient {
    return Intl.message('Patient', name: 'patient', desc: '', args: []);
  }

  /// `Doctor`
  String get doctor {
    return Intl.message('Doctor', name: 'doctor', desc: '', args: []);
  }

  /// `Specialization`
  String get specialization {
    return Intl.message(
      'Specialization',
      name: 'specialization',
      desc: '',
      args: [],
    );
  }

  /// `Age`
  String get age {
    return Intl.message('Age', name: 'age', desc: '', args: []);
  }

  /// `Medicine Taken`
  String get medicine_taken {
    return Intl.message(
      'Medicine Taken',
      name: 'medicine_taken',
      desc: '',
      args: [],
    );
  }

  /// `Chronic Diseases`
  String get chronic_diseases {
    return Intl.message(
      'Chronic Diseases',
      name: 'chronic_diseases',
      desc: '',
      args: [],
    );
  }

  /// `Internal Medicine`
  String get internal_medicine {
    return Intl.message(
      'Internal Medicine',
      name: 'internal_medicine',
      desc: '',
      args: [],
    );
  }

  /// `Surgery`
  String get surgery {
    return Intl.message('Surgery', name: 'surgery', desc: '', args: []);
  }

  /// `Pediatrics`
  String get pediatrics {
    return Intl.message('Pediatrics', name: 'pediatrics', desc: '', args: []);
  }

  /// `Gynecology & Obstetrics`
  String get gynecology {
    return Intl.message(
      'Gynecology & Obstetrics',
      name: 'gynecology',
      desc: '',
      args: [],
    );
  }

  /// `Orthopedics`
  String get orthopedics {
    return Intl.message('Orthopedics', name: 'orthopedics', desc: '', args: []);
  }

  /// `Dermatology`
  String get dermatology {
    return Intl.message('Dermatology', name: 'dermatology', desc: '', args: []);
  }

  /// `Ophthalmology`
  String get ophthalmology {
    return Intl.message(
      'Ophthalmology',
      name: 'ophthalmology',
      desc: '',
      args: [],
    );
  }

  /// `Cardiology`
  String get cardiology {
    return Intl.message('Cardiology', name: 'cardiology', desc: '', args: []);
  }

  /// `Neurology`
  String get neurology {
    return Intl.message('Neurology', name: 'neurology', desc: '', args: []);
  }

  /// `Psychiatry`
  String get psychiatry {
    return Intl.message('Psychiatry', name: 'psychiatry', desc: '', args: []);
  }

  /// `Dentistry`
  String get dentistry {
    return Intl.message('Dentistry', name: 'dentistry', desc: '', args: []);
  }

  /// `Ear, Nose, and Throat (ENT)`
  String get ent {
    return Intl.message(
      'Ear, Nose, and Throat (ENT)',
      name: 'ent',
      desc: '',
      args: [],
    );
  }

  /// `Urology`
  String get urology {
    return Intl.message('Urology', name: 'urology', desc: '', args: []);
  }

  /// `Nephrology`
  String get nephrology {
    return Intl.message('Nephrology', name: 'nephrology', desc: '', args: []);
  }

  /// `Oncology`
  String get oncology {
    return Intl.message('Oncology', name: 'oncology', desc: '', args: []);
  }

  /// `Radiology`
  String get radiology {
    return Intl.message('Radiology', name: 'radiology', desc: '', args: []);
  }

  /// `Anesthesia`
  String get anesthesia {
    return Intl.message('Anesthesia', name: 'anesthesia', desc: '', args: []);
  }

  /// `Intensive Care (ICU)`
  String get icu {
    return Intl.message(
      'Intensive Care (ICU)',
      name: 'icu',
      desc: '',
      args: [],
    );
  }

  /// `Emergency`
  String get emergency {
    return Intl.message('Emergency', name: 'emergency', desc: '', args: []);
  }

  /// `Endocrinology`
  String get endocrinology {
    return Intl.message(
      'Endocrinology',
      name: 'endocrinology',
      desc: '',
      args: [],
    );
  }

  /// `Rheumatology`
  String get rheumatology {
    return Intl.message(
      'Rheumatology',
      name: 'rheumatology',
      desc: '',
      args: [],
    );
  }

  /// `Gastroenterology`
  String get gastroenterology {
    return Intl.message(
      'Gastroenterology',
      name: 'gastroenterology',
      desc: '',
      args: [],
    );
  }

  /// `Pulmonology`
  String get pulmonology {
    return Intl.message('Pulmonology', name: 'pulmonology', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
