import 'package:flutter/material.dart';
import 'package:vinkybox/ui/shared/ui_helpers.dart';

class BottomToolbar extends StatelessWidget {
  const BottomToolbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.grey[300],
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              alignment: Alignment.topCenter,
              onPressed: () {},
              icon: const Icon(
                Icons.home_filled,
                size: 45,
              ),
            ),
            UIHelper.horizontalSpaceLarge(),
            IconButton(
              alignment: Alignment.topCenter,
              onPressed: () {},
              icon: const Icon(
                Icons.store_mall_directory_rounded,
                size: 45,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
