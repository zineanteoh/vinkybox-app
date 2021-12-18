import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:stacked/stacked.dart';
import 'package:vinkybox/constants/dorm_list.dart';
import 'package:vinkybox/ui/shared/app_colors.dart';
import 'package:vinkybox/ui/shared/text_styles.dart';
import 'package:vinkybox/ui/shared/ui_helpers.dart';
import 'package:vinkybox/ui/views/dorm_selection/dorm_selection_viewmodel.dart';

class DormSelectionView extends StatelessWidget {
  const DormSelectionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DormSelectionViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Select Your Dorm', style: headerStyle),
              UIHelper.verticalSpaceLarge(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GroupButton(
                      onSelected: (index, isSelected) =>
                          model.selectUserDorm(index),
                      buttons: dormList,
                      isRadio: true,
                      direction: Axis.horizontal,
                      spacing: 10,
                      selectedTextStyle: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                      unselectedTextStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                      selectedColor: skyblueColor,
                      unselectedColor: Colors.grey[300],
                      selectedBorderColor: skyblueColor,
                      unselectedBorderColor: Color(0xFFBDBDBD),
                      borderRadius: BorderRadius.circular(5.0),
                      selectedShadow: const <BoxShadow>[
                        BoxShadow(color: Colors.transparent)
                      ],
                      unselectedShadow: const <BoxShadow>[
                        BoxShadow(color: Colors.transparent)
                      ],
                    ),
                  ],
                ),
              ),
              UIHelper.verticalSpaceLarge(),
              ElevatedButton(
                onPressed: () => model.submitUserDorm(),
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                ),
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => DormSelectionViewModel(),
    );
  }
}
