import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stacked/stacked.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:timelines/timelines.dart';
import 'package:vinkybox/constants/request_info.dart';
import 'package:vinkybox/ui/shared/app_colors.dart';
import 'package:vinkybox/ui/shared/ui_helpers.dart';
import 'package:vinkybox/ui/views/latest_requests/latest_requests_viewmodel.dart';
import 'package:vinkybox/ui/widgets/dumb_widgets/header_bar.dart';

class LatestRequestsView extends StatelessWidget {
  LatestRequestsView({Key? key}) : super(key: key);

  Widget _buildRequestList(LatestRequestsViewModel model) {
    return SmartRefresher(
      enablePullDown: true,
      controller: model.refreshController,
      footer: CustomFooter(
        builder: (BuildContext context, LoadStatus? mode) {
          Widget body;
          if (mode == LoadStatus.idle) {
            body = Text("pull up load");
          } else if (mode == LoadStatus.loading) {
            body = CupertinoActivityIndicator();
          } else if (mode == LoadStatus.failed) {
            body = Text("Load Failed!Click retry!");
          } else if (mode == LoadStatus.canLoading) {
            body = Text("release to load more");
          } else {
            body = Text("No more Data");
          }
          return Container(
            height: 55.0,
            child: Center(child: body),
          );
        },
      ),
      onRefresh: model.onRefresh,
      onLoading: model.onLoading,
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) => _buildRequestItem(index),
        shrinkWrap: false,
      ),
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

  final Widget status = Center(
    child: Column(
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 15),
          child: Timeline.tileBuilder(
            theme: TimelineThemeData(
              direction: Axis.horizontal,
              nodePosition: 0,
              color: const Color(0xffc2c5c9),
              connectorTheme: const ConnectorThemeData(
                thickness: 3.0,
              ),
            ),
            shrinkWrap: true,
            builder: TimelineTileBuilder.connected(
              connectorBuilder: (context, index, type) {
                // TODO: make this dynamic, based on delivery status
                if (index == -1) {
                  return const SolidLineConnector(
                      color: limeGreenColor);
                } else {
                  return const SolidLineConnector();
                }
              },
              indicatorBuilder: (context, index) {
                // TODO: make this dynamic, based on delivery status
                if (index == 0) {
                  return const DotIndicator(color: limeGreenColor);
                } else {
                  return const DotIndicator();
                }
              },
              itemExtentBuilder: (context, index) => 50,
              itemCount: 4,
            ),
          ),
        ),
        // TODO: make this dynamic, based on delivery status
        const Text('New Request!',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black54))
            .padding(top: 10),
      ],
    ),
  ).padding(top: 12, bottom: 20);

  // .padding(horizontal: 20, vertical: 12);

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
                // status
                Expanded(child: _buildRequestList(model)),
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => LatestRequestsViewModel(),
    );
  }
}
