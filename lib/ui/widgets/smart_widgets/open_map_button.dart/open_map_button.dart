import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:vinkybox/ui/shared/app_colors.dart';
import 'package:vinkybox/ui/widgets/smart_widgets/open_map_button.dart/open_map_button_model.dart';

class OpenMapButton extends StatelessWidget {
  const OpenMapButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OpenMapButtonModel>.reactive(
      builder: (context, model, child) => <Widget>[
        Ink.image(
          image: const AssetImage('assets/images/map_button.jpeg'),
          height: 100,
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.75), BlendMode.dstATop),
        ),
        // Text(
        //   'M A P',
        //   style: TextStyle(
        //     fontSize: 36,
        //     foreground: Paint()
        //       ..style = PaintingStyle.stroke
        //       ..strokeWidth = 4
        //       ..color = Colors.white,
        //   ),
        // ).alignment(Alignment.center).padding(left: 3),
        const Text(
          'Open Map',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            fontFamily: 'Raleway',
            color: mediumSpringGreenColor,
          ),
        ).alignment(Alignment.bottomCenter).padding(bottom: 10),
      ]
          .toStack()
          .alignment(Alignment.center)
          .borderRadius(all: 15)
          .ripple()
          .backgroundColor(Colors.white, animate: true)
          .clipRRect(all: 15) // clip ripple
          .borderRadius(all: 15, animate: true)
          .elevation(
            model.pressed ? 0 : 20,
            borderRadius: BorderRadius.circular(25),
            shadowColor: const Color(0x30000000),
          )
          .constrained(height: 80)
          .gestures(
            onTapChange: (tapState) =>
                model.updatePressedStatus(tapState),
            // onTap: model.onPress,
          )
          .scale(
            all: model.pressed ? 0.95 : 1.0,
            animate: true,
          )
          .animate(
            const Duration(milliseconds: 150),
            Curves.easeOut,
          )
          .padding(vertical: 40),
      viewModelBuilder: () => OpenMapButtonModel(),
    );
  }
}
