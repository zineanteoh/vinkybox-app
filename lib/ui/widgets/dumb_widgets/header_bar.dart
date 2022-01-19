import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
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
        height: 30,
        width: 30,
        child: IconButton(
            padding: const EdgeInsets.all(0),
            onPressed: model.navigateBack,
            icon: const Icon(
              CarbonIcons.chevron_left,
              size: 30,
            )),
      ),
      Text(
        headerText,
        style: const TextStyle(
            fontSize: 28, fontWeight: FontWeight.bold),
      ).padding(left: 8.0).alignment(Alignment.center),
    ].toRow();
  }
}
