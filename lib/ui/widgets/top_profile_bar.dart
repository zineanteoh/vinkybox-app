import 'package:flutter/material.dart';

class TopProfileBar extends StatelessWidget {
  const TopProfileBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.only(top: 10.0, right: 30.0),
        alignment: Alignment.centerRight,
        height: 60,
        // decoration: BoxDecoration(
        //   color: Colors.black,
        //   borderRadius: BorderRadius.circular(50 / 2),
        // ),
        child: const Image(
          image: AssetImage('assets/images/temp_profile.png'),
        ),
        // child: CachedNetworkImage(
        //   imageUrl:
        //       "https://secure.gravatar.com/avatar/ef4a9338dca42372f15427cdb4595ef7",
        //   placeholder: (context, url) =>
        //       new CircularProgressIndicator(),
        //   errorWidget: (context, url, error) => new Icon(Icons.error),
        // ),
      ),
    );
  }
}
