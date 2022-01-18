import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:vinkybox/ui/shared/app_colors.dart';
import 'package:vinkybox/ui/views/delivery/delivery_viewmodel.dart';
import 'package:vinkybox/ui/widgets/smart_widgets/request_delivery_button/request_delivery_button_model.dart';

class RequestDeliveryButton extends StatelessWidget {
  final DeliveryViewModel deliveryModel;
  const RequestDeliveryButton({Key? key, required this.deliveryModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RequestDeliveryButtonModel>.reactive(
      onModelReady: (model) => model.initialize(deliveryModel),
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

        final Widget icon = const Icon(CarbonIcons.delivery_parcel,
                size: 20, color: Colors.white)
            .padding(all: 12)
            .decorated(
              color: blueJeansColor,
              borderRadius: BorderRadius.circular(30),
            )
            .padding(left: 15, right: 10);

        const Widget title = Text(
          "Request Delivery",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        );

        const Widget description = Text(
          "Too busy? Let others deliver for you!",
          style: TextStyle(
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
