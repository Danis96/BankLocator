class Location {
  final double lat;
  final double lng;

  Location({this.lat, this.lng});

  Location.fromJson(Map<dynamic, dynamic> jsonParsed)
      : lat = jsonParsed['lat'],
        lng = jsonParsed['long'];
}
