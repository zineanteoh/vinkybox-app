import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class TopProfileBar extends StatelessWidget {
  const TopProfileBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double profilePicSize = 70;
    return SafeArea(
      child: GestureDetector(
        onTap: () {},
        child: Material(
          elevation: 4.0,
          shape: const CircleBorder(),
          clipBehavior: Clip.hardEdge,
          color: Colors.transparent,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(profilePicSize / 2),
            child: Ink.image(
                width: profilePicSize,
                height: profilePicSize,
                image: const AssetImage(
                    'assets/images/temp_profile.png'),
                child: InkWell(
                  onTap: () {
                    print('clicked');
                  },
                )),
          ),
          // child: CachedNetworkImage(
          //   imageUrl:
          //       "https://secure.gravatar.com/avatar/ef4a9338dca42372f15427cdb4595ef7",
          //   placeholder: (context, url) =>
          //       new CircularProgressIndicator(),
          //   errorWidget: (context, url, error) => new Icon(Icons.error),
          // ),
        ),
      ),
    );
  }
}
