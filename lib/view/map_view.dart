import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iss_tracker/controller/controller.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

// This is the veiw of the application it is a Map with a single buttons that find the international space station.
// App structure: View -> contains the GoogeMaps view aswell as a google maps controller to change views
//                     -> View also contains a controllers for fetching Data from the ISS tracker API
// Controller -> Is called from the view and runs commands on a model, the Controller also pulls any data to
//            -> display on the UI in the form of Latitude and Longatude for the Map view
// Model -> Handles the Network request to the API, aswell as storing what data is to be displayed on the screen
//       -> Interacts with the controller.

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Google Maps Demo',
      home: MapView(),
    );
  }
}

class MapView extends StatefulWidget {
  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends StateMVC {
  _MapViewState() : super(Controller()) {
    // MVC controller
    // Acquire a reference to the particular Controller.
    con = controller as Controller;
  }
  Controller con;
  Completer<GoogleMapController> _controller =
      Completer(); // Google map Controller

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(49.26, -123.24),
    zoom: 11,
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        myLocationButtonEnabled: false,
        mapType: MapType.hybrid,
        initialCameraPosition: CameraPosition(
          target: LatLng(con.lat, con.long),
          zoom: 11,
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          con.updateLocation();
          await Future.delayed(Duration(seconds: 1));
          var _spaceStationLocation = CameraPosition(
            target: LatLng(con.lat, con.long),
            zoom: 5,
          );
          _findSpaceStation(_spaceStationLocation);
        },
        label: Text('Find the space station!'),
        icon: Icon(Icons.star),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Future<void> _findSpaceStation(_spaceStationLocation) async {
    print("displaying position Lat:${con.lat}, Long: ${con.long}");
    final GoogleMapController controller = await _controller.future;
    controller
        .animateCamera(CameraUpdate.newCameraPosition(_spaceStationLocation));
  }
}
