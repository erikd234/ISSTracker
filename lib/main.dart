import 'view/map_view.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Google Maps Demo',
      home: MapView(),
    );
  }
}

// This is the main screen of the application, here we run the application, and start the first veiw.
