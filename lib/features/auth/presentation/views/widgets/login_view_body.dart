import 'package:flutter/material.dart';
import 'package:medi_link/core/constants/app_size.dart';
import 'package:medi_link/core/utils/widgets/custom_button.dart';
import 'package:medi_link/core/utils/widgets/custom_text_form_field.dart';
import 'package:medi_link/core/utils/widgets/password_field.dart';
import 'package:medi_link/features/auth/presentation/views/widgets/dont_have_account_widget.dart';
import 'package:medi_link/generated/l10n.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  late String email, password;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(height: AppSize.getScreenHeight(context) * .09),
              CustomTextFormField(
                hitText: S.of(context).email,
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) {
                  email = value!;
                },
              ),
              const SizedBox(height: 16),
              PasswordField(
                onSaved: (value) {
                  password = value!;
                },
              ),
              const SizedBox(height: 33),
              CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    // context.read<SigninCubit>().signInWithEmailAndPassword(
                    //   email: email,
                    //   password: password,
                    // );
                  } else {
                    autoValidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
                text: S.of(context).login,
              ),
              const SizedBox(height: 33),
              const Align(
                alignment: Alignment.center,
                child: DontHaveAccountWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
