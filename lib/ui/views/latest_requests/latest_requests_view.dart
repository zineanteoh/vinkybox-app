import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:vinkybox/ui/shared/app_colors.dart';
import 'package:vinkybox/ui/shared/ui_helpers.dart';
import 'package:vinkybox/ui/views/latest_requests/latest_requests_viewmodel.dart';
import 'package:vinkybox/ui/widgets/dumb_widgets/header_bar.dart';

class LatestRequestsView extends StatelessWidget {
  LatestRequestsView({Key? key}) : super(key: key);

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
        name,
        time,
        location,
        status,
      ].toColumn(
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }

  final Widget name =
      const Text('Zi Teoh', style: TextStyle(fontSize: 18))
          .padding(top: 20, left: 20);

  final Widget time = const Text('2:50PM, Jan 1',
          style: TextStyle(fontSize: 14, color: Colors.black38))
      .padding(top: 4, left: 20);

  final Widget location = Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Pick Up',
              style:
                  TextStyle(color: Colors.blue[200], fontSize: 14)),
          Text('Drop Off',
              style: TextStyle(color: Colors.blue[200], fontSize: 14))
        ],
      ),
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
      )
    ],
  ).padding(vertical: 12, horizontal: 20);

  final Widget status = const Center(
    child: Text(
      'Status: new',
      style: TextStyle(
        fontSize: 18,
        // color: limeGreenColor,
      ),
    ),
  ).padding(horizontal: 20, vertical: 12);

  Widget requestItem({required Widget child}) {
    return Styled.widget(child: child)
        .alignment(Alignment.center)
        .borderRadius(all: 15)
        .ripple()
        .backgroundColor(Colors.white)
        .clipRRect(all: 25)
        .borderRadius(all: 25)
        .elevation(
          20,
          borderRadius: BorderRadius.circular(25),
          shadowColor: const Color(0x30000000),
        )
        .padding(vertical: 10);
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
