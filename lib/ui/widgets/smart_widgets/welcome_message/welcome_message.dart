import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:vinkybox/ui/widgets/smart_widgets/welcome_message/welcome_message_model.dart';

class WelcomeMessage extends StatelessWidget {
  const WelcomeMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WelcomeMessageModel>.reactive(
      builder: (context, model, child) => <Widget>[
        Text(
          'Hello ${model.getCurrentUserName()}',
          style: TextStyle(
            fontSize: 26.w,
            color: Colors.black38,
          ),
        ),
        Text(
          'Good Morning!',
          style: TextStyle(
            fontSize: 28.w,
            fontWeight: FontWeight.bold,
          ),
        ),
      ].toColumn(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      viewModelBuilder: () => WelcomeMessageModel(),
    );
  }
}
