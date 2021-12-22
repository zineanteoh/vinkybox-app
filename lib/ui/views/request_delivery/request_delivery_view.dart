import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:vinkybox/ui/views/request_delivery/request_delivery_viewmodel.dart';

class RequestDeliveryView extends StatelessWidget {
  const RequestDeliveryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RequestDeliveryViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Container(),
      ),
      viewModelBuilder: () => RequestDeliveryViewModel(),
    );
  }
}
