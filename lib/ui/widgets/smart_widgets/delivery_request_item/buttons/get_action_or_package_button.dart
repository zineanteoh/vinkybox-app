import 'package:flutter/material.dart';
import 'package:vinkybox/ui/widgets/smart_widgets/delivery_request_item/buttons/cancel_accept_buttons.dart';
import 'package:vinkybox/ui/widgets/smart_widgets/delivery_request_item/buttons/track_package_button.dart';
import 'package:vinkybox/ui/widgets/smart_widgets/delivery_request_item/delivery_request_item_model.dart';

Widget getActionOrPackageButton(
    DeliveryRequestItemModel model, BuildContext context) {
  // my package & not delivering => track
  // my package & delivering => sizedbox
  // not my package & not new => sizedbox
  // not my package & new => action buttons
  if (model.isMyPackage()) {
    return model.statusIsDelivering()
        ? trackPackageButton(model, context)
        : const SizedBox.shrink();
  }
  return model.statusIsNotNew()
      ? const SizedBox.shrink()
      : cancelAcceptButtons(model, context);
}
