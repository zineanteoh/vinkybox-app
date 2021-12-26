import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:vinkybox/ui/shared/app_colors.dart';
import 'package:vinkybox/ui/views/marketplace/marketplace_viewmodel.dart';

class MarketPlaceView extends StatelessWidget {
  const MarketPlaceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MarketPlaceViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                const Center(
                  child: Icon(
                    CarbonIcons.store,
                    size: 80,
                    color: indianRedColor,
                  ),
                ).padding(top: 40, right: 20),
                const Text(
                  'Coming Soon...',
                  style: TextStyle(
                      color: indianRedColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   crossAxisAlignment: CrossAxisAlignment.end,
            //   children: const <Widget>[
            //     TopProfileBar(),
            //     WelcomeMessage(),
            //   ],
            // ),
          ],
        ),
      ),
      viewModelBuilder: () => MarketPlaceViewModel(),
    );
  }
}
