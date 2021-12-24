import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:vinkybox/ui/shared/app_colors.dart';

class LatestRequestsHeader extends StatelessWidget {
  const LatestRequestsHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Latest Requests',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        TextButton(
          child: Row(
            children: const <Widget>[
              Text('See all',
                  style: TextStyle(color: darkBeigeColor)),
              Icon(CarbonIcons.caret_right, color: darkBeigeColor)
            ],
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
