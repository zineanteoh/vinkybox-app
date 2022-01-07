import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:vinkybox/ui/shared/app_colors.dart';

class MyCurrentPackagesHeader extends StatelessWidget {
  final int myCurrentPackagesCount;
  const MyCurrentPackagesHeader(
      {Key? key, required this.myCurrentPackagesCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          myCurrentPackagesCount == 0
              ? 'My Current Packages'
              : 'My Current Packages (${myCurrentPackagesCount})',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        TextButton(
            child: Row(
              children: const <Widget>[
                Text('See all',
                    style: TextStyle(color: darkBeigeColor)),
                Icon(CarbonIcons.caret_right, color: darkBeigeColor)
              ],
            ).padding(left: 10),
            onPressed: () {
              //
            },
            style: ButtonStyle(
              overlayColor:
                  MaterialStateProperty.all<Color>(lightBeigeColor),
            )),
      ],
    );
  }
}
