import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:vinkybox/ui/views/delivery/my_packages/my_packages_viewmodel.dart';
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
              children: [
                HeaderBar(
                  model: model,
                  headerText: "My Packages",
                ),
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
      viewModelBuilder: () => MyPackagesViewModel(),
    );
  }
}
