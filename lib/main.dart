import 'package:banklocator/models/bankModel.dart';
import 'package:banklocator/notifiers/statusNotifier.dart';
import 'package:banklocator/services/geolocationService.dart';
import 'package:banklocator/services/getApi.dart';
import 'package:banklocator/services/locationService.dart';
import 'package:banklocator/view/HomePage/page/home.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

 
void main() => runApp(MyApp());


 
class MyApp extends StatelessWidget {

  final locatorService = GeoLocatorService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bank Locator',
      home: MultiProvider(
           providers: [
             ListenableProvider<StatusNotifier>(
               create: (_) => StatusNotifier('EmptyState'),
             ),
              FutureProvider(create: (context) => locatorService.getLocation()),

           ],
        child:Home(),
      ),
    );
  }
}