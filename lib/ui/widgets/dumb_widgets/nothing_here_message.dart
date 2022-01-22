import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:styled_widget/styled_widget.dart';

class NothingHereMessage extends StatelessWidget {
  final String imageUrl;
  final String nothingMessage1;
  final String nothingMessage2;
  const NothingHereMessage(
      {Key? key,
      required this.imageUrl,
      required this.nothingMessage1,
      required this.nothingMessage2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      Image.asset(imageUrl, width: 120)
          .padding(top: 25.h, bottom: 5.h),
      Text(
        nothingMessage1,
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      Text(
        nothingMessage2,
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
    ].toColumn();
  }
}
