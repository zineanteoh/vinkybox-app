import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:vinkybox/ui/views/delivery/delivery_view.dart';
import 'package:vinkybox/ui/views/home/home_viewmodel.dart';
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
          children: <Widget>[
            const DeliveryView().padding(
              horizontal: 20,
              vertical: 50,
            ),
            const MarketPlaceView()
                .padding(horizontal: 20, vertical: 50),
          ],
        ),
        bottomNavigationBar: const BottomToolbar(),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
