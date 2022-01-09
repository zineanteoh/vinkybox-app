import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:vinkybox/ui/views/delivery/current_tasks/current_tasks_viewmodel.dart';

class CurrentTasksView extends StatelessWidget {
  const CurrentTasksView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CurrentTasksViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Text('You have ${model.getCurrentTasksCount()} task(s)')
            .alignment(Alignment.center),
      ),
      viewModelBuilder: () => CurrentTasksViewModel(),
    );
  }
}
