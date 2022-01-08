import 'package:vinkybox/ui/shared/app_colors.dart';
import 'package:vinkybox/ui/views/startup/startup_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stacked/stacked.dart';

class StartUpView extends StatelessWidget {
  const StartUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartUpViewModel>.reactive(
      onModelReady: (model) => SchedulerBinding.instance
          ?.addPostFrameCallback((timeStamp) async {
        model.runStartupLogic();
      }),
      builder: (context, model, child) => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                width: 500,
                height: 200,
                child: Image.asset('assets/images/vinkybox_logo.png'),
              ),
              const CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation(blueJeansColorHex),
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => StartUpViewModel(),
    );
  }
}
