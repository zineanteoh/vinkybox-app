import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:stacked/stacked.dart';
import 'package:vinkybox/constants/request_info.dart';
import 'package:vinkybox/ui/shared/app_colors.dart';
import 'package:vinkybox/ui/shared/text_styles.dart';
import 'package:vinkybox/ui/shared/ui_helpers.dart';
import 'package:vinkybox/ui/views/my_packages/my_packages_viewmodel.dart';

class MyPackagesView extends StatelessWidget {
  const MyPackagesView({Key? key}) : super(key: key);

  Widget requestTopBar(model) {
    return Row(
      children: [
        SizedBox(
          height: 30,
          width: 30,
          child: IconButton(
              padding: const EdgeInsets.all(0),
              onPressed: model.navigateBack,
              icon: const Icon(
                CarbonIcons.chevron_left,
                size: 30,
              )),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(
            "My Packages",
            style:
                TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MyPackagesViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 50.0),
              child: Column(
                children: [
                  requestTopBar(model),
                  // UIHelper.verticalSpaceMedium(),
                  // requestPackageSizeSection(model),
                  // requestPickUpLocationSection(model),
                  // requestDropOffLocationSection(model),
                  // requestTimeSection(model),
                  // UIHelper.verticalSpaceMedium(),
                  // requestSubmit(model),
                ],
              ),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => MyPackagesViewModel(),
    );
  }
}
