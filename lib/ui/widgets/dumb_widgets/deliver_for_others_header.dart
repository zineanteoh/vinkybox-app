import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vinkybox/app/app.locator.dart';

class DeliverForOthersHeader extends StatelessWidget {
  final int latestRequestCount;
  const DeliverForOthersHeader(
      {Key? key, required this.latestRequestCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _navigationService = locator<NavigationService>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          // 'Latest Requests',
          latestRequestCount == 0
              ? 'Deliver For Others'
              : 'Deliver For Others ($latestRequestCount)',
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ],
    );
  }
}
