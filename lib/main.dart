import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_link/app_view.dart';
import 'package:medi_link/core/services/getit_services.dart';
import 'package:medi_link/language_cubit.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setup();
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
