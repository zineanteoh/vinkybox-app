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
import 'package:vinkybox/ui/widgets/smart_widgets/delivery_request_item/delivery_request_item.dart';

class LatestRequestsView extends StatelessWidget {
  LatestRequestsView({Key? key}) : super(key: key);

  Widget _buildRequestList(LatestRequestsViewModel model) {
    return SmartRefresher(
      header: const ClassicHeader(
        completeText: 'Request is up to date!',
        idleText: 'Pull to Refresh',
        refreshingText: 'Fetching Requests...',
      ),
      enablePullDown: true,
      controller: model.refreshController,
      footer: CustomFooter(
        builder: (BuildContext context, LoadStatus? mode) {
          Widget body;
          if (mode == LoadStatus.idle) {
            body = const Text("pull up load");
          } else if (mode == LoadStatus.loading) {
            body = const CupertinoActivityIndicator();
          } else if (mode == LoadStatus.failed) {
            body = const Text("Load Failed!Click retry!");
          } else if (mode == LoadStatus.canLoading) {
            body = const Text("release to load more");
          } else {
            body = const Text("No more Data");
          }
          return Container(
            height: 55.0,
            child: Center(child: body),
          );
        },
      ),
      onRefresh: model.onRefresh,
      child: ListView.builder(
        itemCount: model.deliveryRequestList.length,
        itemBuilder: (context, index) =>
            _buildRequestItem(model.deliveryRequestList[index]),
        shrinkWrap: false,
      ),
    );
  }

  Widget _buildRequestItem(document) {
    return requestItem(
      child: <Widget>[
        name(document['user']['fullName']),
        time(document['time']),
        location(
            document['pickUpLocation'], document['user']['dorm']),
        status,
      ].toColumn(
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }

  Widget name(String name) {
    return Text(name, style: const TextStyle(fontSize: 18))
        .padding(top: 20, left: 20);
  }

  Widget time(String time) {
    // '2:50PM, Jan 1',
    return Text(time,
            style:
                const TextStyle(fontSize: 14, color: Colors.black38))
        .padding(top: 4, left: 20);
  }

  Widget location(String pickUpLocation, String dropOffLocation) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Pick Up',
                style:
                    TextStyle(color: Colors.blue[200], fontSize: 14)),
            Text('Drop Off',
                style:
                    TextStyle(color: Colors.blue[200], fontSize: 14))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(pickUpLocation,
                style: const TextStyle(
                    color: skyblueColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            Text(dropOffLocation,
                style: const TextStyle(
                    color: skyblueColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ],
        )
      ],
    ).padding(vertical: 12, horizontal: 20);
  }

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

  Widget requestItem({required Widget child}) {
    return DeliveryRequestItem(myChild: child);
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LatestRequestsViewModel>.reactive(
      onModelReady: (model) => model.loadLatestRequests(),
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
                model.isBusy
                    ? const CircularProgressIndicator()
                    : Expanded(child: _buildRequestList(model)),
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => LatestRequestsViewModel(),
    );
  }
}
