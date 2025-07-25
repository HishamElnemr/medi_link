import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_link/generated/l10n.dart';
import 'package:medi_link/language_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(icon: const Icon(Icons.language), onPressed: () {
            context.read<LanguageCubit>().toggleLanguage();
          }),
        ],
      ),
      body: Center(child: Text(S.of(context).welcome)),
    );
  }
}
