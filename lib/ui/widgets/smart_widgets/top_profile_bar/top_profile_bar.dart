import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:vinkybox/ui/widgets/smart_widgets/top_profile_bar/top_profile_bar_model.dart';

class TopProfileBar extends StatelessWidget {
  const TopProfileBar({Key? key}) : super(key: key);

  final double profilePicSize = 70;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TopProfileBarModel>.reactive(
      builder: (context, model, child) {
        Widget profilePic({required Widget child}) {
          return Styled.widget(child: child)
              .ripple(
                customBorder: const CircleBorder(),
              )
              .elevation(
                model.pressed ? 0 : 20,
                borderRadius: BorderRadius.circular(25),
                shadowColor: const Color(0x30000000),
              )
              .gestures(
                onTapChange: (tapState) =>
                    model.updatePressedStatus(tapState),
              )
              .scale(
                all: model.pressed ? 0.95 : 1.0,
                animate: true,
              )
              .animate(
                const Duration(milliseconds: 150),
                Curves.easeOut,
              );
        }

        return profilePic(
          child: CachedNetworkImage(
            height: profilePicSize,
            width: profilePicSize,
            imageUrl: model.getProfilePicUrl(),
            imageBuilder: (context, imageProvider) => CircleAvatar(
              radius: profilePicSize,
              backgroundImage: imageProvider,
            ),
            placeholder: (context, url) =>
                const CircularProgressIndicator(),
            errorWidget: (context, url, error) =>
                const Icon(Icons.error),
          ),
        );
      },
      viewModelBuilder: () => TopProfileBarModel(),
    );
  }
}

// Material(
//   elevation: 4.0,
//   shape: const CircleBorder(),
//   clipBehavior: Clip.hardEdge,
//   color: Colors.transparent,
//   child: ClipRRect(
//     borderRadius: BorderRadius.circular(profilePicSize / 2),
//     child: Ink.image(
//         width: profilePicSize,
//         height: profilePicSize,
//         image: const AssetImage(
//             'assets/images/temp_profile.png'),
//         child: InkWell(
//           onTap: () {
//             print('clicked');
//           },
//         )),
//   ),
//   // child: CachedNetworkImage(
//   //   imageUrl:
//   //       "https://secure.gravatar.com/avatar/ef4a9338dca42372f15427cdb4595ef7",
//   //   placeholder: (context, url) =>
//   //       new CircularProgressIndicator(),
//   //   errorWidget: (context, url, error) => new Icon(Icons.error),
//   // ),
// ),