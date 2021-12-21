import 'package:flutter/material.dart';

class TopProfileBar extends StatelessWidget {
  const TopProfileBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.only(top: 10.0, right: 30.0),
        alignment: Alignment.centerRight,
        child: Material(
          shape: const CircleBorder(),
          clipBehavior: Clip.hardEdge,
          color: Colors.transparent,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: Ink.image(
                width: 60,
                height: 60,
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
