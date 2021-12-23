import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:titled_navigation_bar/titled_navigation_bar.dart';
import 'package:vinkybox/ui/shared/app_colors.dart';

class BottomToolbar extends StatelessWidget {
  const BottomToolbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TitledBottomNavigationBar(
      height: 50,
      indicatorHeight: 2.5,
      onTap: (index) {
        // print('Selected index: $index');
      },
      curve: Curves.easeInBack,
      activeColor: skyblueColor,
      reverse: true,
      enableShadow: true,
      items: [
        TitledNavigationBarItem(
          icon: const Icon(CarbonIcons.delivery_parcel),
          title: const Text(
            'Delivery',
            style: TextStyle(fontSize: 18),
          ),
        ),
        TitledNavigationBarItem(
          icon: const Icon(CarbonIcons.store),
          title: const Text(
            'Marketplace',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }
}
