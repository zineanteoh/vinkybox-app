import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vinkybox/app/app.locator.dart';
import 'package:vinkybox/app/app.router.dart';
import 'package:vinkybox/ui/shared/app_colors.dart';

class DeliverForOthersHeader extends StatelessWidget {
  final int latestRequestCount;
  const DeliverForOthersHeader(
      {Key? key, required this.latestRequestCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _navigationService = locator<NavigationService>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          // 'Latest Requests',
          latestRequestCount == 0
              ? 'Deliver For Others'
              : 'Deliver For Others ($latestRequestCount)',
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20),
        ),
        // TextButton(
        //   child: Padding(
        //     padding: const EdgeInsets.only(left: 10.0),
        //     child: Row(
        //       children: const <Widget>[
        //         Text('See all',
        //             style: TextStyle(color: darkBeigeColor)),
        //         Icon(CarbonIcons.caret_right, color: darkBeigeColor)
        //       ],
        //     ),
        //   ),
        //   onPressed: () {
        //     _navigationService.navigateTo(Routes.latestRequestsView);
        //   },
        //   style: ButtonStyle(
        //     overlayColor:
        //         MaterialStateProperty.all<Color>(lightBeigeColor),
        //   ),
        // ),
      ],
    );
  }
}
