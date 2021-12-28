import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:vinkybox/ui/shared/ui_helpers.dart';
import 'package:vinkybox/ui/views/my_packages/my_packages_viewmodel.dart';
import 'package:vinkybox/ui/widgets/dumb_widgets/header_bar.dart';

class MyPackagesView extends StatelessWidget {
  const MyPackagesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MyPackagesViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 50.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderBar(
                  model: model,
                  headerText: "My Packages",
                ),
                UIHelper.verticalSpaceMedium(),
                UIHelper.verticalSpaceMedium(),
                // const Text(
                //   'Current',
                //   style: TextStyle(
                //       fontWeight: FontWeight.w400, fontSize: 24),
                // ),
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => MyPackagesViewModel(),
    );
  }
}
