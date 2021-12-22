import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:vinkybox/ui/views/home/home_viewmodel.dart';
import 'package:vinkybox/ui/widgets/dumb_widgets/bottom_toolbar.dart';
import 'package:vinkybox/ui/widgets/dumb_widgets/delivery_overview.dart';
import 'package:vinkybox/ui/widgets/dumb_widgets/top_profile_bar.dart';
import 'package:vinkybox/ui/widgets/smart_widgets/welcome_message/welcome_message.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  TopProfileBar(),
                  WelcomeMessage(),
                ],
              ),
            ),
            const DeliveryOverview(),
          ],
        ),
        bottomNavigationBar: const BottomToolbar(),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
