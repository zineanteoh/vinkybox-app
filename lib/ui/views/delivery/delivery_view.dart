import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stacked/stacked.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:vinkybox/ui/shared/ui_helpers.dart';
import 'package:vinkybox/ui/views/delivery/delivery_viewmodel.dart';
import 'package:vinkybox/ui/widgets/dumb_widgets/my_current_packages_header.dart';
import 'package:vinkybox/ui/widgets/dumb_widgets/nothing_here_message.dart';
import 'package:vinkybox/ui/widgets/smart_widgets/current_task_button/current_task_button.dart';
import 'package:vinkybox/ui/widgets/smart_widgets/delivery_request_item/delivery_request_item.dart';
import 'package:vinkybox/ui/widgets/smart_widgets/package_history_button/package_history_button.dart';
import 'package:vinkybox/ui/widgets/smart_widgets/profile_pic/profile_pic.dart';
import 'package:vinkybox/ui/widgets/smart_widgets/request_delivery_button/request_delivery_button.dart';
import 'package:vinkybox/ui/widgets/smart_widgets/welcome_message/welcome_message.dart';

class DeliveryView extends StatefulWidget {
  const DeliveryView({Key? key}) : super(key: key);

  @override
  State<DeliveryView> createState() => _DeliveryViewState();
}

class _DeliveryViewState extends State<DeliveryView>
    with AutomaticKeepAliveClientMixin<DeliveryView> {
  _userActionButtons(DeliveryViewModel model) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        RequestDeliveryButton(deliveryModel: model)
            .padding(top: 10.h),
        const PackageHistoryButton().padding(top: 10.h),
        const CurrentTaskButton().padding(top: 10.h),
      ],
    );
  }

  _myPackagesSection(DeliveryViewModel model) {
    return <Widget>[
      MyCurrentPackagesHeader(
          myCurrentPackagesCount: model.getLatestRequestCount()),
      Container(
        child: model.isBusy
            ? const CircularProgressIndicator()
            : model.isRequestEmpty
                ? const NothingHereMessage(
                    imageUrl: "assets/images/parachute.png",
                    nothingMessage1: "Nothing here...",
                    nothingMessage2: "Why not request a delivery?")
                : DeliveryRequestItem(
                    deliveryRequest:
                        model.myCurrentPackagesList.requestList[0]),
      ),
    ].toColumn().padding(top: 20);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ViewModelBuilder<DeliveryViewModel>.reactive(
      onModelReady: (model) => model.onRefresh(),
      disposeViewModel: false,
      builder: (context, model, child) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              const ProfilePic(),
              const WelcomeMessage().padding(left: 15.w),
            ],
          ),
          Expanded(
            child: SmartRefresher(
              header: const ClassicHeader(
                completeText: 'Request is up to date!',
                idleText: 'Pull to Refresh',
                refreshingText: 'Fetching Requests...',
              ),
              enablePullDown: true,
              controller: model.refreshController,
              onRefresh: model.onRefresh,
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) => Column(
                  children: [
                    _userActionButtons(model),
                    _myPackagesSection(model),
                  ],
                ),
              ),
            ),
          ),
        ],
      ).padding(
        horizontal: 20.w,
        top: 50.h,
      ),
      viewModelBuilder: () => DeliveryViewModel(),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
