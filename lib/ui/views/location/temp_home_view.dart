import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:vinkybox/ui/views/location/temp_home_viewmodel.dart';

class TempHomeView extends StatelessWidget {
  const TempHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TempHomeViewModel>.reactive(
      onModelReady: (model) => model.initializeLocationService(),
      viewModelBuilder: () => TempHomeViewModel(),
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('hello'),
              ElevatedButton(
                onPressed: () {},
                child: Text('read examples'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('write examples'),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.location_searching),
          onPressed: () {
            model.navigate();
          },
        ),
      ),
    );
  }
}
