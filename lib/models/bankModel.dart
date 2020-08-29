import 'package:banklocator/models/locationModel.dart';
import 'package:banklocator/models/workingHoursModel.dart';
import 'package:flutter/cupertino.dart';

class BankModel {
  final int id;
  final String name;
  final String address;
  final String phone;
  final String email;
  final String website;
  final String type;
  final Location location;
  final WorkingHoursModel workingHours;

  BankModel({this.id, this.name, this.address, this.phone, this.email,
    this.website, this.type, this.location, this.workingHours});

  BankModel.fromDocument(dynamic jsonParsed)
  : id = jsonParsed['id'],
    name = jsonParsed['name'],
    address = jsonParsed['address'],
    phone = (jsonParsed['phone'] != null) ?  jsonParsed['phone'] : null,
    email = jsonParsed['email'],
    website = jsonParsed['website'],
    type = jsonParsed['type'],
    location = Location.fromJson(jsonParsed['location']),
    workingHours = (jsonParsed['working_hours'] != null) ?  WorkingHoursModel.fromJson(jsonParsed['working_hours']) : null;
}