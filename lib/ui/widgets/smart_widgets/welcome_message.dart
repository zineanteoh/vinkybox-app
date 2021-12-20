import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:vinkybox/ui/widgets/smart_widgets/welcome_message_model.dart';

class WelcomeMessage extends StatelessWidget {
  const WelcomeMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WelcomeMessageModel>.reactive(
      builder: (context, model, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Text(
          'Welcome ${model.getCurrentUserName()}',
          style: const TextStyle(
            fontSize: 35,
          ),
        ),
      ),
      viewModelBuilder: () => WelcomeMessageModel(),
    );
  }
}
