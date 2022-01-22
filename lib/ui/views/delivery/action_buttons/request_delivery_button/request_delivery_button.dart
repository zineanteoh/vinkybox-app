import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:vinkybox/ui/shared/app_colors.dart';
import 'package:vinkybox/ui/views/delivery/action_buttons/request_delivery_button/request_delivery_button_model.dart';
import 'package:vinkybox/ui/views/delivery/delivery_viewmodel.dart';
import 'package:vinkybox/ui/widgets/smart_widgets/action_button/action_button.dart';

class RequestDeliveryButton extends StatelessWidget {
  final DeliveryViewModel
      deliveryModel; // to enable auto refresh when request goes through
  const RequestDeliveryButton({Key? key, required this.deliveryModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RequestDeliveryButtonModel>.reactive(
      onModelReady: (model) => model.initialize(deliveryModel),
      builder: (context, model, child) {
        return ActionButton(
          iconData: CarbonIcons.delivery_parcel,
          iconColor: blueJeansColor,
          actionTitle: "Request Delivery",
          actionDescription: "Too busy? Let others deliver for you!",
          onPressFunction: model.onPress,
        );
      },
      viewModelBuilder: () => RequestDeliveryButtonModel(),
    );
  }
}
