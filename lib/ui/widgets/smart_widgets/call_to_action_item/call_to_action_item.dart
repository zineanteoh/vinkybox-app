import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class CallToActionItem extends StatefulWidget {
  final IconData icon;
  final Color iconBgColor;
  final String title;
  final String description;

  CallToActionItem(
      {Key? key,
      required this.icon,
      required this.iconBgColor,
      required this.title,
      required this.description})
      : super(key: key);
  @override
  _CallToActionItemState createState() => _CallToActionItemState();
}

class _CallToActionItemState extends State<CallToActionItem> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    final callToActionItem = ({required Widget child}) =>
        Styled.widget(child: child)
            .alignment(Alignment.center)
            .borderRadius(all: 15)
            .ripple()
            .backgroundColor(Colors.white, animate: true)
            .clipRRect(all: 25) // clip ripple
            .borderRadius(all: 25, animate: true)
            .elevation(
              pressed ? 0 : 20,
              borderRadius: BorderRadius.circular(25),
              shadowColor: Color(0x30000000),
            ) // shadow borderRadius
            .constrained(height: 80)
            .padding(vertical: 12) // margin
            .gestures(
              onTapChange: (tapStatus) =>
                  setState(() => pressed = tapStatus),
              onTapDown: (details) => print('tapDown'),
              onTap: () => print('onTap'),
            )
            .scale(
              all: pressed ? 0.95 : 1.0,
              animate: true,
            )
            .animate(
                const Duration(milliseconds: 150), Curves.easeOut);

    final Widget icon =
        Icon(widget.icon, size: 20, color: Colors.white)
            .padding(all: 12)
            .decorated(
              color: widget.iconBgColor,
              borderRadius: BorderRadius.circular(30),
            )
            .padding(left: 15, right: 10);

    final Widget title = Text(
      widget.title,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    ).padding(bottom: 5);

    final Widget description = Text(
      widget.description,
      style: TextStyle(
        color: Colors.black26,
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
    );

    return callToActionItem(
      child: <Widget>[
        icon,
        <Widget>[
          title,
          description,
        ].toColumn(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ].toRow(),
    );
  }
}
