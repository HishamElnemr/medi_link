import 'package:flutter/material.dart';
import 'package:medi_link/core/utils/widgets/build_app_bar.dart';
import 'package:medi_link/features/auth/presentation/views/widgets/signup_view_body.dart';
import 'package:medi_link/generated/l10n.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: S.of(context).sign_up),
      body: const SignupViewBody(),
    );
  }
}
