import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:vinkybox/ui/shared/app_colors.dart';
import 'package:vinkybox/ui/views/delivery/action_buttons/current_task_button/current_task_button_model.dart';
import 'package:vinkybox/ui/widgets/smart_widgets/action_button/action_button.dart';

class CurrentTaskButton extends StatelessWidget {
  const CurrentTaskButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CurrentTaskButtonModel>.reactive(
      builder: (context, model, child) {
        return ActionButton(
            iconData: CarbonIcons.task,
            iconColor: mediumSpringGreenColor,
            actionTitle: "Current Tasks",
            actionDescription: "See all your current tasks here!",
            onPressFunction: model.onPress,
            isCurrentTask: true);
      },
      viewModelBuilder: () => CurrentTaskButtonModel(),
    );
  }
}
