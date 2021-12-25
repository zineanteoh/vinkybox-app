import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:vinkybox/ui/widgets/smart_widgets/delivery_request_item/delivery_request_item_model.dart';

class DeliveryRequestItem extends StatelessWidget {
  final Widget myChild;
  const DeliveryRequestItem({required this.myChild, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DeliveryRequestItemModel>.reactive(
      builder: (context, model, child) =>
          Styled.widget(child: myChild)
              .alignment(Alignment.center)
              .borderRadius(all: 15)
              .ripple()
              .backgroundColor(Colors.white, animate: true)
              .clipRRect(all: 25)
              .borderRadius(all: 25, animate: true)
              .elevation(
                model.pressed ? 0 : 20,
                borderRadius: BorderRadius.circular(25),
                shadowColor: const Color(0x30000000),
              )
              .gestures(
                onTapChange: (tapState) =>
                    model.updatePressedStatus(tapState),
                onTap: () {},
              )
              .scale(
                all: model.pressed ? 0.95 : 1.0,
                animate: true,
              )
              .animate(
                const Duration(milliseconds: 150),
                Curves.easeOut,
              )
              .padding(vertical: 10),
      viewModelBuilder: () => DeliveryRequestItemModel(),
    );
  }
}
