import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:vinkybox/ui/views/delivery/delivery_viewmodel.dart';
import 'package:vinkybox/ui/widgets/dumb_widgets/delivery_overview.dart';
import 'package:vinkybox/ui/widgets/smart_widgets/top_profile_bar/top_profile_bar.dart';
import 'package:vinkybox/ui/widgets/smart_widgets/welcome_message/welcome_message.dart';

class DeliveryView extends StatelessWidget {
  const DeliveryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DeliveryViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const <Widget>[
                TopProfileBar(),
                WelcomeMessage(),
              ],
            ),
            const DeliveryOverview(),
          ],
        ),
      ),
      viewModelBuilder: () => DeliveryViewModel(),
    );
  }
}
