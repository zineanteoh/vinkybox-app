import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:vinkybox/ui/widgets/smart_widgets/request_delivery_button/request_delivery_button_model.dart';

class RequestDeliveryButton extends StatelessWidget {
  const RequestDeliveryButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RequestDeliveryButtonModel>.reactive(
      builder: (context, model, child) {
        Widget deliveryButton({required Widget child}) {
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
              .constrained(height: 80)
              .gestures(
                onTapChange: (tapState) =>
                    model.updatePressedStatus(tapState),
                onTap: model.onPress,
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

        final Widget icon =
            Icon(model.icon, size: 20, color: Colors.white)
                .padding(all: 12)
                .decorated(
                  color: model.iconBgColor,
                  borderRadius: BorderRadius.circular(30),
                )
                .padding(left: 15, right: 10);

        final Widget title = Text(
          model.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        );

        final Widget description = Text(
          model.description,
          style: const TextStyle(
            color: Colors.black26,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        );

        return deliveryButton(
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
      },
      viewModelBuilder: () => RequestDeliveryButtonModel(),
    );
  }
}
