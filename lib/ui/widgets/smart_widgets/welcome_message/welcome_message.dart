import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:vinkybox/ui/widgets/smart_widgets/welcome_message/welcome_message_model.dart';

class WelcomeMessage extends StatelessWidget {
  const WelcomeMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WelcomeMessageModel>.reactive(
      builder: (context, model, child) => Container(
        padding: const EdgeInsets.only(left: 20.0, top: 40.0),
        // alignment: Alignment.centerRight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello ${model.getCurrentUserName()}',
              style: const TextStyle(
                fontSize: 26,
                color: Colors.black38,
              ),
            ),
            const Text(
              'Good Morning!',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 32),
            ),
          ],
        ),
      ),
      viewModelBuilder: () => WelcomeMessageModel(),
    );
  }
}
