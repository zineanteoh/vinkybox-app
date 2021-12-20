import 'package:flutter/material.dart';

class DeliveryOverview extends StatelessWidget {
  const DeliveryOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              height: 70.0,
              padding: const EdgeInsets.only(left: 20.0),
            ),
          ),
        ],
      ),
    );
  }
}
