import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:vinkybox/ui/shared/text_styles.dart';
import 'package:vinkybox/ui/views/latest_requests/latest_requests_viewmodel.dart';
import 'package:vinkybox/ui/widgets/dumb_widgets/header_bar.dart';

class LatestRequestsView extends StatelessWidget {
  const LatestRequestsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LatestRequestsViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 50.0),
              child: Column(
                children: [
                  HeaderBar(
                    model: model,
                    headerText: "Latest Requests",
                  ),
                  // UIHelper.verticalSpaceMedium(),
                  // requestPackageSizeSection(model),
                  // requestPickUpLocationSection(model),
                  // requestDropOffLocationSection(model),
                  // requestTimeSection(model),
                  // UIHelper.verticalSpaceMedium(),
                  // requestSubmit(model),
                ],
              ),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => LatestRequestsViewModel(),
    );
  }
}


// class MyPackagesView extends StatelessWidget {
//   const MyPackagesView({Key? key}) : super(key: key);

//   Widget requestTopBar(model) {
//     return Row(
//       children: [
//         SizedBox(
//           height: 30,
//           width: 30,
//           child: IconButton(
//               padding: const EdgeInsets.all(0),
//               onPressed: model.navigateBack,
//               icon: const Icon(
//                 CarbonIcons.chevron_left,
//                 size: 30,
//               )),
//         ),
//         const Padding(
//           padding: EdgeInsets.only(left: 8.0),
//           child: Text(
//             "My Packages",
//             style:
//                 TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//           ),
//         ),
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ViewModelBuilder<MyPackagesViewModel>.reactive(
//       builder: (context, model, child) => Scaffold(
//         body: Scaffold(
//           body: SafeArea(
//             child: Padding(
//               padding: const EdgeInsets.only(left: 20.0, top: 50.0),
//               child: Column(
//                 children: [
//                   requestTopBar(model),
//                   // UIHelper.verticalSpaceMedium(),
//                   // requestPackageSizeSection(model),
//                   // requestPickUpLocationSection(model),
//                   // requestDropOffLocationSection(model),
//                   // requestTimeSection(model),
//                   // UIHelper.verticalSpaceMedium(),
//                   // requestSubmit(model),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//       viewModelBuilder: () => MyPackagesViewModel(),
//     );
//   }
// }

