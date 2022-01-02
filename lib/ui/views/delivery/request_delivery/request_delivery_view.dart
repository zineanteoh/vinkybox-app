import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:stacked/stacked.dart';
import 'package:vinkybox/constants/request_info.dart';
import 'package:vinkybox/ui/shared/app_colors.dart';
import 'package:vinkybox/ui/shared/text_styles.dart';
import 'package:vinkybox/ui/shared/ui_helpers.dart';
import 'package:vinkybox/ui/views/delivery/request_delivery/request_delivery_viewmodel.dart';
import 'package:vinkybox/ui/widgets/dumb_widgets/header_bar.dart';

class RequestDeliveryView extends StatelessWidget {
  const RequestDeliveryView({Key? key}) : super(key: key);

  Widget requestSection(
      model, headerTitle, buttonsList, onSelectedFunction) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        UIHelper.verticalSpaceMedium(),
        Text('$headerTitle', style: subHeaderStyle),
        UIHelper.verticalSpaceSmall(),
        GroupButton(
          mainGroupAlignment: MainGroupAlignment.start,
          isRadio: true,
          spacing: 10,
          buttons: buttonsList,
          selectedColor: skyblueColor,
          borderRadius: BorderRadius.circular(30),
          onSelected: (i, selected) => onSelectedFunction(i),
        ),
      ],
    );
  }

  Widget requestPackageSizeSection(model) {
    return requestSection(model, "My package is", requestPackageSize,
        model.selectPackageSize);
  }

  Widget requestPickUpLocationSection(model) {
    return requestSection(model, "located at Station B",
        requestPickUpLocation, model.selectPickUpLocation);
  }

  Widget requestDropOffLocationSection(model) {
    return requestSection(model, "I want it dropped off at",
        requestDropOffLocation, model.selectDropOffLocation);
  }

  Widget requestTimeSection(model) {
    return requestSection(
        model, "Between", requestTime, model.selectTime);
  }

  Widget requestSubmit(model) {
    return Center(
      child: ElevatedButton(
        onPressed: model.submitRequest,
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(skyblueColor),
        ),
        child: const Text('Submit', style: TextStyle(fontSize: 20)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RequestDeliveryViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 50.0),
            child: Column(
              children: [
                HeaderBar(
                  model: model,
                  headerText: "Request Delivery",
                ),
                UIHelper.verticalSpaceMedium(),
                requestPackageSizeSection(model),
                requestPickUpLocationSection(model),
                requestDropOffLocationSection(model),
                requestTimeSection(model),
                UIHelper.verticalSpaceMedium(),
                requestSubmit(model),
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => RequestDeliveryViewModel(),
    );
  }
}
