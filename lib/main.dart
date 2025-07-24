import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_link/app_view.dart';
import 'package:medi_link/language_cubit.dart';

void main() {
  runApp(const MediLink());
}

class MediLink extends StatelessWidget {
  const MediLink({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LanguageCubit(),
      child: BlocBuilder<LanguageCubit, Locale>(
        builder: (context, locale) {
          return AppView(locale: locale);
        },
      ),
    );
  }
}
