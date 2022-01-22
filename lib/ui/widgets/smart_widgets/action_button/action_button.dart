import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:vinkybox/ui/widgets/smart_widgets/action_button/action_button_model.dart';

class ActionButton extends StatelessWidget {
  final IconData iconData;
  final Color iconColor;
  final String actionTitle;
  final String actionDescription;
  final Function onPressFunction; // function to call when pressed

  const ActionButton({
    Key? key,
    required this.iconData,
    required this.iconColor,
    required this.actionTitle,
    required this.actionDescription,
    required this.onPressFunction,
  }) : super(key: key);

  Widget _deliveryButton(
      {required Widget child, required ActionButtonModel model}) {
    return Styled.widget(child: child)
        .alignment(Alignment.center)
        .borderRadius(all: 15)
        .ripple()
        .backgroundColor(Colors.white, animate: true)
        .clipRRect(all: 25) // clip ripple
        .borderRadius(all: 25, animate: true)
        .elevation(
          model.pressed ? 0 : 20,
          borderRadius: BorderRadius.circular(25),
          shadowColor: const Color(0x30000000),
        )
        .constrained(height: 60.h)
        .gestures(
          onTapChange: (tapState) =>
              model.updatePressedStatus(tapState),
          onTap: () => model.onPress(onPressFunction),
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

  Widget _icon() {
    return Icon(iconData, size: 20.sp, color: Colors.white)
        .padding(all: 10.sp)
        .decorated(
          color: iconColor,
          borderRadius: BorderRadius.circular(30),
        )
        .padding(left: 15.w, right: 10.w);
  }

  Widget _title() {
    return Text(
      actionTitle,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15.sp,
      ),
    );
  }

  Widget _description() {
    return Text(
      actionDescription,
      style: TextStyle(
        color: Colors.black26,
        fontWeight: FontWeight.bold,
        fontSize: 12.sp,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ActionButtonModel>.reactive(
        viewModelBuilder: () => ActionButtonModel(),
        builder: (context, model, child) => _deliveryButton(
            child: <Widget>[
              _icon(),
              <Widget>[
                _title(),
                _description(),
              ].toColumn(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
              )
            ].toRow(),
            model: model));
  }
}
