import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:vinkybox/ui/shared/app_colors.dart';
import 'package:vinkybox/ui/views/delivery/action_buttons/package_history_button/package_history_button_model.dart';
import 'package:vinkybox/ui/widgets/smart_widgets/action_button/action_button.dart';

class PackageHistoryButton extends StatelessWidget {
  const PackageHistoryButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PackageHistoryButtonModel>.reactive(
      builder: (context, model, child) {
        return ActionButton(
            iconData: CarbonIcons.recently_viewed,
            iconColor: orangeYellowCrayolaColor,
            actionTitle: "Package History",
            actionDescription: "Click to see your past packages!",
            onPressFunction: model.onPress);
      },
      viewModelBuilder: () => PackageHistoryButtonModel(),
    );
  }
}
