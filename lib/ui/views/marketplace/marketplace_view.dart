import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:vinkybox/ui/shared/text_styles.dart';
import 'package:vinkybox/ui/views/marketplace/marketplace_viewmodel.dart';

class MarketPlaceView extends StatelessWidget {
  const MarketPlaceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MarketPlaceViewModel>.reactive(
      builder: (context, model, child) => const Scaffold(
        body: Center(
          child: Text('Welcome to the Vinky Marketplace',
              style: headerStyle),
        ),
      ),
      viewModelBuilder: () => MarketPlaceViewModel(),
    );
  }
}
