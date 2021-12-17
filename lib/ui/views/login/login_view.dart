import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:vinkybox/ui/views/login/login_viewmodel.dart';

import 'package:auth_buttons/auth_buttons.dart'
    show AuthButtonStyle, GoogleAuthButton;

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 500,
                height: 200,
                child: Image.asset('assets/images/vinkybox_logo.png'),
              ),
              // Add auth buttons
              const SizedBox(height: 30),
              GoogleAuthButton(
                style: const AuthButtonStyle(
                  buttonType: AuthButtonType.secondary,
                  iconType: AuthIconType.secondary,
                ),
                onPressed: () {
                  model.loginWithGoogle();
                },
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => LoginViewModel(),
    );
  }
}
