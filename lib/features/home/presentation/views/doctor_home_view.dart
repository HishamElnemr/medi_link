import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_link/core/routes/routes_name.dart';
import 'package:medi_link/generated/l10n.dart';
import 'package:medi_link/language_cubit.dart';

class DoctorHomeView extends StatelessWidget {
  const DoctorHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () {
              context.read<LanguageCubit>().toggleLanguage();
            },
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          FirebaseAuth.instance.signOut();
          Navigator.pushReplacementNamed(context, RoutesName.login);
        },
        child: Center(child: Text(S.of(context).welcome)),
      ),
    );
  }
}