import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:titled_navigation_bar/titled_navigation_bar.dart';
import 'package:vinkybox/ui/shared/app_colors.dart';
import 'package:vinkybox/ui/widgets/smart_widgets/bottom_toolbar/bottom_toolbar_model.dart';

class BottomToolbar extends StatelessWidget {
  const BottomToolbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BottomToolbarModel>.reactive(
      builder: (context, model, child) => TitledBottomNavigationBar(
        height: 50,
        indicatorHeight: 2.5,
        onTap: (index) {
          model.setCurrentIndex(index);
        },
        curve: Curves.easeInBack,
        activeColor: skyblueColor,
        reverse: true,
        enableShadow: true,
        currentIndex: model.currentIndex,
        items: [
          TitledNavigationBarItem(
            icon: const Icon(CarbonIcons.home),
            title: const Text(
              'My Home',
              style: TextStyle(fontSize: 18),
            ),
          ),
          TitledNavigationBarItem(
            icon: const Icon(CarbonIcons.delivery_parcel),
            title: const Text(
              'Deliver For Others',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
      viewModelBuilder: () => BottomToolbarModel(),
    );
  }
}
