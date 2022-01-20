import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:vinkybox/ui/widgets/smart_widgets/top_profile_bar/top_profile_bar_model.dart';

class TopProfileBar extends StatelessWidget {
  const TopProfileBar({Key? key}) : super(key: key);

  _showModalBottomSheet(
      {required BuildContext context,
      required TopProfileBarModel model}) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
            // height: 1000.h,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  // add rounded corners
                  topLeft: Radius.circular(30.w),
                  topRight: Radius.circular(30.w),
                )),
            child: <Widget>[
              Text(
                'Profile',
                style: TextStyle(fontSize: 18.sp),
              ).padding(top: 20.h),
              CachedNetworkImage(
                height: 100.w,
                width: 100.w,
                imageUrl: model.getProfilePicUrl(),
                imageBuilder: (context, imageProvider) =>
                    CircleAvatar(
                  // radius: 70.w,
                  backgroundImage: imageProvider,
                ),
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) =>
                    const Icon(Icons.error),
              ).padding(vertical: 15.h),
              // User Information
              Text(
                '${model.name}',
                style: TextStyle(
                    fontSize: 24.sp, fontWeight: FontWeight.w600),
              ),
              Text('${model.dorm}',
                  style: TextStyle(
                      fontSize: 20.sp, fontWeight: FontWeight.w200)),
              // User Statistics
              <Widget>[
                <Widget>[
                  Text('0 Packages',
                      style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w500)),
                  Text(
                    'Sent',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ].toColumn(),
                <Widget>[
                  Text('0 Packages',
                      style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w500)),
                  Text(
                    'Received',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ].toColumn(),
              ]
                  .toRow(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly)
                  .padding(top: 25.h)
            ]
                .toColumn(mainAxisSize: MainAxisSize.min)
                .padding(bottom: 70.h));
      },
    );
  }

  _profilePic(
      {required Widget child,
      required TopProfileBarModel model,
      required BuildContext context}) {
    return Styled.widget(child: child)
        .ripple(
          customBorder: const CircleBorder(),
        )
        .elevation(
          model.pressed ? 0 : 20,
          borderRadius: BorderRadius.circular(25.w),
          shadowColor: const Color(0x30000000),
        )
        .gestures(
          onTapChange: (tapState) =>
              model.updatePressedStatus(tapState),
          onTap: () {
            _showModalBottomSheet(context: context, model: model);
          },
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

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TopProfileBarModel>.reactive(
      builder: (context, model, child) {
        return _profilePic(
          context: context,
          model: model,
          child: CachedNetworkImage(
            height: 70.w,
            width: 70.w,
            imageUrl: model.getProfilePicUrl(),
            imageBuilder: (context, imageProvider) => CircleAvatar(
              radius: 70.w,
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
