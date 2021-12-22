import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:stacked/stacked.dart';
import 'package:vinkybox/ui/shared/app_colors.dart';
import 'package:vinkybox/ui/shared/text_styles.dart';
import 'package:vinkybox/ui/shared/ui_helpers.dart';
import 'package:vinkybox/ui/views/request_delivery/request_delivery_viewmodel.dart';

class RequestDeliveryView extends StatelessWidget {
  const RequestDeliveryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RequestDeliveryViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20.0, vertical: 50.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: model.navigateBack,
                          icon: Icon(CarbonIcons.chevron_left)),
                      const Text(
                        "Reqeust A Delivery",
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  UIHelper.verticalSpaceMedium(),
                  const Text('My package is', style: subHeaderStyle),
                  UIHelper.verticalSpaceSmall(),
                  GroupButton(
                    mainGroupAlignment: MainGroupAlignment.start,
                    isRadio: true,
                    spacing: 10,
                    buttons: const [
                      'Small',
                      'Medium',
                      'Large',
                    ],
                    selectedColor: skyblueColor,
                    borderRadius: BorderRadius.circular(30),
                    onSelected: (i, selected) =>
                        debugPrint('Button #$i selected'),
                  ),
                  UIHelper.verticalSpaceMedium(),
                  const Text('located at', style: subHeaderStyle),
                  UIHelper.verticalSpaceSmall(),
                  GroupButton(
                    mainGroupAlignment: MainGroupAlignment.start,
                    isRadio: true,
                    spacing: 10,
                    buttons: const [
                      'Station B Lockerbank',
                      'Station B Counter',
                    ],
                    selectedColor: skyblueColor,
                    borderRadius: BorderRadius.circular(30),
                    onSelected: (i, selected) =>
                        debugPrint('Button #$i selected'),
                  ),
                  UIHelper.verticalSpaceMedium(),
                  const Text('I want it dropped off at',
                      style: subHeaderStyle),
                  UIHelper.verticalSpaceSmall(),
                  GroupButton(
                    mainGroupAlignment: MainGroupAlignment.start,
                    isRadio: true,
                    spacing: 10,
                    buttons: const [
                      'Main Lobby Entrance',
                      'My room',
                      'Seminar Room',
                      'Somewhere Else',
                    ],
                    selectedColor: skyblueColor,
                    borderRadius: BorderRadius.circular(30),
                    onSelected: (i, selected) =>
                        debugPrint('Button #$i selected'),
                  ),
                  UIHelper.verticalSpaceMedium(),
                  const Text('Between', style: subHeaderStyle),
                  UIHelper.verticalSpaceSmall(),
                  GroupButton(
                    mainGroupAlignment: MainGroupAlignment.start,
                    isRadio: true,
                    spacing: 10,
                    buttons: const [
                      'Anytime',
                      '11 - 12PM',
                      '12 - 1PM',
                      '1 - 2PM',
                      '2 - 3PM',
                      '3 - 4PM',
                    ],
                    selectedColor: skyblueColor,
                    borderRadius: BorderRadius.circular(30),
                    onSelected: (i, selected) =>
                        debugPrint('Button #$i selected'),
                  ),
                  UIHelper.verticalSpaceMedium(),
                  // UIHelper.verticalSpaceLarge(),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(
                                skyblueColor),
                      ),
                      child: const Text('Submit',
                          style: TextStyle(fontSize: 20)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => RequestDeliveryViewModel(),
    );
  }
}
