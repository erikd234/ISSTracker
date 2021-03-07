import 'dart:convert';
import 'package:http/http.dart' as http;
import 'entities/iss_now_data.dart';

// MODEL -> had the network request and sets the location of the screen
// the inital location is centered on UBC in vancouver.
// when readLocation is called it read the location from the ISS tracker API
// then it updates the Location object.

class Model {
  // setting the intial location;

  Location location = Location('49.26', '-123.24');

  Future<void> readLocation() async {
    var url = Uri.parse('http://api.open-notify.org/iss-now.json');
    var res = await http.get(url);
    if (res.statusCode != 200)
      throw Exception('http.get error: statusCode= ${res.statusCode}');
    print(res.body);

    var issNowDataAsMap = json.decode(res.body);
    var issNowData = IssNowData.fromJson(issNowDataAsMap);

    location = issNowData.location;
  }
}
