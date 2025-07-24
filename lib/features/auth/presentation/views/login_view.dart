import 'package:flutter/material.dart';
import 'package:medi_link/core/utils/widgets/build_app_bar.dart';
import 'package:medi_link/generated/l10n.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: S.of(context).login,
        isVisible: false,
      ),
    );
  }
}
