import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:vinkybox/app/app.locator.dart';
import 'package:vinkybox/app/app.router.dart';
import 'package:vinkybox/ui/shared/app_colors.dart';

class MyPackagesHeader extends StatelessWidget {
  final int myCurrentPackagesCount;
  const MyPackagesHeader(
      {Key? key, required this.myCurrentPackagesCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _navigationService = locator<NavigationService>();
    return <Widget>[
      Text(
        myCurrentPackagesCount == 0
            ? 'My Packages'
            : 'My Packages ($myCurrentPackagesCount)',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.sp,
        ),
      ),
      TextButton(
        child: Row(
          children: <Widget>[
            Text('See all',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: darkBeigeColor,
                )),
            const Icon(
              CarbonIcons.caret_right,
              color: darkBeigeColor,
            ),
          ],
        ),
        onPressed: () {
          _navigationService.navigateTo(Routes.myPackagesView);
        },
        style: ButtonStyle(
          overlayColor:
              MaterialStateProperty.all<Color>(lightBeigeColor),
        ),
      ),
    ].toRow(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
    );
  }
}
