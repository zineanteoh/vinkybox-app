import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:vinkybox/ui/views/delivery/delivery_view.dart';
import 'package:vinkybox/ui/views/home/home_viewmodel.dart';
import 'package:vinkybox/ui/views/location/temp_home_view.dart';
import 'package:vinkybox/ui/views/marketplace/marketplace_view.dart';
import 'package:vinkybox/ui/widgets/smart_widgets/bottom_toolbar/bottom_toolbar.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: PageView(
          controller: model.pageController,
          onPageChanged: (value) => model.onPageChange(value),
          children: const <Widget>[
            DeliveryView(),
            TempHomeView(),
          ],
        ),
        bottomNavigationBar: const BottomToolbar(),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
