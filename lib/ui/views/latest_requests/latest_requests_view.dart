import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:vinkybox/ui/shared/app_colors.dart';
import 'package:vinkybox/ui/shared/text_styles.dart';
import 'package:vinkybox/ui/shared/ui_helpers.dart';
import 'package:vinkybox/ui/views/latest_requests/latest_requests_viewmodel.dart';
import 'package:vinkybox/ui/widgets/dumb_widgets/header_bar.dart';

class LatestRequestsView extends StatelessWidget {
  const LatestRequestsView({Key? key}) : super(key: key);

  Widget _buildRequestList() {
    return ListView.builder(
      itemCount: 100,
      itemBuilder: (context, index) => _buildRequestItem(index),
      shrinkWrap: false,
    );
  }

  Widget _buildRequestItem(index) {
    return requestItem(
      child: <Widget>[
        // Name
        const Text(
          'Zi Teoh',
          style: TextStyle(
            fontSize: 18,
          ),
        ).padding(top: 12, left: 12),
        // Time
        const Text(
          '2:50PM, Jan 1',
          style: TextStyle(
            fontSize: 14,
            color: Colors.black38,
          ),
        ).padding(top: 4, left: 12),
        // Pick up & drop off
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text('Station B Counter',
                style: TextStyle(
                    color: skyblueColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            Text('West',
                style: TextStyle(
                    color: skyblueColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ],
        ).padding(all: 12),
        // Status
        const Center(
            child: Text(
          'Status: new',
          style: TextStyle(
            fontSize: 18,
            // color: limeGreenColor,
          ),
        )).padding(horizontal: 20, vertical: 12),
      ].toColumn(
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }

  Widget requestItem({required Widget child}) {
    return Styled.widget(child: child)
        .backgroundColor(Colors.white)
        .padding(vertical: 10)
        .borderRadius(all: 10);
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
