import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:vinkybox/ui/views/delivery/current_delivery/current_delivery_viewmodel.dart';

class CurrentDeliveryView extends StatelessWidget {
  const CurrentDeliveryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CurrentDeliveryViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
          body: const Text('Hello').alignment(Alignment.center)),
      viewModelBuilder: () => CurrentDeliveryViewModel(),
    );
  }
}
