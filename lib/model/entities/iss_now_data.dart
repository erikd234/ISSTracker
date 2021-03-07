// these are the Dart entites that are getting parse from the JSON response
// on the ISS tracker free API.

class IssNowData {
  final String message;
  final int timeStamp;
  final Location location;

  IssNowData(this.message, this.timeStamp, this.location);
  IssNowData.fromJson(Map<String, dynamic> json)
      : message = json["message"],
        timeStamp = json["timestamp"],
        location = Location.fromJson(json["iss_position"]);
}

class Location {
  final String lat;
  final String long;

  Location(this.lat, this.long);
  Location.fromJson(Map<String, dynamic> json)
      : lat = json["latitude"],
        long = json["longitude"];
}
