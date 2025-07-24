import 'dart:io';

import 'package:flutter/material.dart';
import 'package:medi_link/core/constants/app_colors.dart';
import 'package:medi_link/core/constants/font_styles.dart';
import 'package:medi_link/core/utils/assets.dart';
import 'package:medi_link/core/utils/widgets/custom_button.dart';
import 'package:medi_link/core/utils/widgets/custom_text_form_field.dart';
import 'package:medi_link/core/utils/widgets/password_field.dart';
import 'package:medi_link/features/auth/presentation/views/widgets/dont_have_account_widget.dart';
import 'package:medi_link/features/auth/presentation/views/widgets/or_divider.dart';
import 'package:medi_link/features/auth/presentation/views/widgets/social_login_button.dart';

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
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(height: 24),
              CustomTextFormField(
                hitText: 'البريد الالكتروني',
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
              const SizedBox(height: 16),
              Text(
                'نسيت كلمة المرور؟',
                style: FontStyles.light12.copyWith(
                  color: AppColors.primaryBlue
                ),
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
                text: 'تسجيل الدخول',
              ),
              const SizedBox(height: 33),
              const Align(
                alignment: Alignment.center,
                child: DontHaveAccountWidget(),
              ),
              const SizedBox(height: 33),
              const OrDivider(),
              const SizedBox(height: 16),
              SocialLoginButton(
                iconPath: Assets.assetsImagesGoogleIcon,
                text: 'تسجيل الدخول باستخدام جوجل',
                onPressed: () {
                  // context.read<SigninCubit>().signInWithGoogle();
                },
              ),
              const SizedBox(height: 16),
              SocialLoginButton(
                iconPath: Assets.assetsImagesFacebookIcon,
                text: 'تسجيل الدخول باستخدام فيسبوك',
                onPressed: () {
                  // context.read<SigninCubit>().signInWithFacebook();
                },
              ),
              const SizedBox(height: 16),
              Platform.isIOS
                  ? Column(
                      children: [
                        SocialLoginButton(
                          iconPath: 'assets/images/appl_icon.svg',
                          text: 'تسجيل الدخول باستخدام ابل',
                          onPressed: () {
                            // context.read<SigninCubit>().signInWithApple();
                          },
                        ),
                        const SizedBox(height: 16),
                      ],
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}