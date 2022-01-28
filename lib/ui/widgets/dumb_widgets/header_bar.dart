import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:styled_widget/styled_widget.dart';

class HeaderBar extends StatelessWidget {
  final model;
  final String headerText;
  const HeaderBar(
      {Key? key, required this.model, required this.headerText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      SizedBox(
        height: 30.w,
        width: 30.w,
        child: IconButton(
            padding: const EdgeInsets.all(0),
            onPressed: model.navigateBack,
            icon: Icon(
              CarbonIcons.chevron_left,
              size: 30.w,
            )),
      ),
      Text(
        headerText,
        style: TextStyle(fontSize: 28.w, fontWeight: FontWeight.bold),
      ).padding(left: 8.w).alignment(Alignment.center),
    ].toRow();
  }
}
