import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:stacked/stacked.dart';
import 'package:vinkybox/ui/views/onboarding/onboarding_viewmodel.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = PageDecoration(
      titleTextStyle:
          TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return ViewModelBuilder<OnboardingViewModel>.reactive(
      builder: (context, model, child) => IntroductionScreen(
        // key: introKey,
        globalBackgroundColor: Colors.white,
        pages: [
          PageViewModel(
            title: "Welcome",
            body:
                "VinkyBox is a student-driven package delivery platform.",
            image: model.buildImage('onboarding_delivery.png'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "Send a request",
            body:
                "Too busy? \n\nYou can quickly request to have your packages delivered to your dorm!",
            image: model.buildImage('onboarding_request.png'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "Delivery for others",
            body:
                "Going back to dorm and happen to be near Station B? \n\nDelivery packages for other students on campus!",
            image: model.buildImage('onboarding_delivery.png'),
            decoration: pageDecoration,
          ),
        ],
        onDone: () => model.onIntroEnd(),
        //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
        showSkipButton: true,
        skipFlex: 0,
        nextFlex: 0,
        //rtl: true, // Display as right-to-left
        skip: const Text('Skip'),
        next: const Icon(Icons.arrow_forward),
        done: const Text('Done',
            style: TextStyle(fontWeight: FontWeight.w600)),
        curve: Curves.fastLinearToSlowEaseIn,
        controlsMargin: const EdgeInsets.all(16),
        controlsPadding:
            const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
        dotsDecorator: const DotsDecorator(
          size: Size(10.0, 10.0),
          color: Color(0xFFBDBDBD),
          activeSize: Size(22.0, 10.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
        dotsContainerDecorator: const ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
        ),
      ),
      viewModelBuilder: () => OnboardingViewModel(),
    );
  }
}
