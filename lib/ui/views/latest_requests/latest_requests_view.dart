import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:vinkybox/ui/shared/ui_helpers.dart';
import 'package:vinkybox/ui/views/latest_requests/latest_requests_viewmodel.dart';
import 'package:vinkybox/ui/widgets/dumb_widgets/header_bar.dart';

class LatestRequestsView extends StatelessWidget {
  const LatestRequestsView({Key? key}) : super(key: key);

  Widget _buildRequestList() {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) => _buildRequestItem(index),
      shrinkWrap: false,
    );
  }

  Widget _buildRequestItem(index) {
    return ListTile(
      title: Text('hello $index'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LatestRequestsViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.only(bottom: 32),
            padding: const EdgeInsets.only(
                left: 20.0, right: 20.0, top: 50.0),
            child: Column(
              children: [
                HeaderBar(
                  model: model,
                  headerText: "Latest Requests",
                ),
                UIHelper.verticalSpaceMedium(),
                Expanded(child: _buildRequestList()),
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => LatestRequestsViewModel(),
    );
  }
}
