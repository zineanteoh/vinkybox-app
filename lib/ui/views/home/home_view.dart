import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:vinkybox/ui/views/home/home_viewmodel.dart';
import 'package:vinkybox/ui/widgets/bottom_toolbar.dart';
import 'package:vinkybox/ui/widgets/delivery_overview.dart';
import 'package:vinkybox/ui/widgets/top_profile_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TopProfileBar(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Welcome ${model.getCurrentUserName()}',
                style: const TextStyle(
                  fontSize: 35,
                ),
              ),
            ),
            DeliveryOverview(),
            const BottomToolbar(),
          ],
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
