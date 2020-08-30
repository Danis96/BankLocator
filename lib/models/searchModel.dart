

import 'package:banklocator/models/locationModel.dart';

class SearchModel {
   final String name;
   final String address;
   final String type;
   final dynamic location;


   SearchModel({this.name, this.address, this.type, this.location});


   SearchModel.fromJson(Map<dynamic, dynamic> jsonParsed)
       : name = jsonParsed['name'],
         address = jsonParsed['address'],
         type = jsonParsed['type'],
         location = jsonParsed['location'];
}