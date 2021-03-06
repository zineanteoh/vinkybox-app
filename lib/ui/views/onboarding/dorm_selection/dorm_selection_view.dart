import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:vinkybox/constants/dorm_list.dart';
import 'package:vinkybox/ui/shared/app_colors.dart';
import 'package:vinkybox/ui/shared/text_styles.dart';
import 'package:vinkybox/ui/shared/ui_helpers.dart';
import 'package:vinkybox/ui/views/onboarding/dorm_selection/dorm_selection_viewmodel.dart';

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
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.fromLTRB(70, 10, 70, 10),
                    child: TextButton(
                      onPressed: () => showModalBottomSheet(
                        backgroundColor: Colors.white,
                        context: context,
                        builder: (context) {
                          return ListView.builder(
                            itemCount: dormList.length,
                            itemBuilder: (context, index) => ListTile(
                              title: Text(
                                dormList[index],
                              ),
                              onTap: () {
                                model.selectUserDorm(index);
                                Navigator.pop(context);
                              },
                            ),
                          );
                        },
                      ),
                      child: Text(
                        model.hasSelectedDorm()
                            ? model.userDorm
                            : 'Click Here',
                        style: const TextStyle(
                          fontSize: 24,
                          color: blueJeansColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              UIHelper.verticalSpaceLarge(),
              Container(
                child: model.isBusy
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () => model.submitUserInfo(),
                        style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 20),
                        ),
                        child: const Text('Submit'),
                      ),
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => DormSelectionViewModel(),
    );
  }
}
