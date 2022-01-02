import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:vinkybox/ui/shared/ui_helpers.dart';
import 'package:vinkybox/ui/views/login/login_viewmodel.dart';
import 'package:styled_widget/styled_widget.dart';
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
              UIHelper.verticalSpaceMedium(),
              // GoogleAuthButton(
              //   style: const AuthButtonStyle(
              //     buttonType: AuthButtonType.secondary,
              //     iconType: AuthIconType.secondary,
              //   ),
              //   onPressed: () {
              //     model.loginWithGoogle();
              //   },
              // ),
              // TEMPORARY
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () => model.temporaryLogin(1),
                      child: const Text('Login as Phoebe')),
                  ElevatedButton(
                      onPressed: () => model.temporaryLogin(2),
                      child: const Text('Login as Jane')),
                  ElevatedButton(
                      onPressed: () => model.temporaryLogin(3),
                      child: const Text('Login as Zi')),
                ],
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => LoginViewModel(),
    );
  }
}
