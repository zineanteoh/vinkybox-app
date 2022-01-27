import 'package:flutter/material.dart';
import 'package:vinkybox/constants/request_info.dart';
import 'package:vinkybox/ui/widgets/smart_widgets/delivery_request_item/buttons/delivery_complete_button.dart';
import 'package:vinkybox/ui/widgets/smart_widgets/delivery_request_item/buttons/i_am_ready_to_pick_up_button.dart';
import 'package:vinkybox/ui/widgets/smart_widgets/delivery_request_item/delivery_request_item_model.dart';

Widget taskActionButton(bool isUserTask,
    DeliveryRequestItemModel model, BuildContext context) {
  return isUserTask
      ? model.statusInfo == deliveryStatus[1]
          ? iAmReadyToPickUpButton(model, context)
          : model.statusInfo == deliveryStatus[2]
              ? deliveryCompleteButton(model, context)
              : const SizedBox.shrink()
      : const SizedBox.shrink();
}
