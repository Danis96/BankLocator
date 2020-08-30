import 'dart:async';

import 'package:banklocator/utils/colors.dart';
import 'package:banklocator/utils/size_config.dart';
import 'package:banklocator/view/HomePage/page/home.dart';
import 'package:banklocator/view/ListOfBanks/page/listOfBanks.dart';
import 'package:banklocator/view/SplashScreen/duringSplash.dart';
import 'package:banklocator/view/SplashScreen/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

Completer<GoogleMapController> controllerG = Completer();

class MapPage extends StatelessWidget {

  final secondaryColor = AppColors().secondaryColor;
  final dominantColor = AppColors().dominantColor;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final currentPosition = Provider.of<Position>(context);

    return
      Scaffold(
        body: (currentPosition != null) ? Container(
          height: SizeConfig.blockSizeVertical * 92,
          child: GoogleMap(
            buildingsEnabled: true,
            markers: Set<Marker>.of(markers),
            initialCameraPosition: CameraPosition(
              target: lat == null ? LatLng(43.9159, 17.6791) : LatLng(lat, long) ,
              zoom: lat == null ?  7.0 : 16.0,
            ),
            mapType: MapType.normal,
            myLocationEnabled: selectedIndex == 0 ? true : false,
            zoomGesturesEnabled: true,
            indoorViewEnabled: true,
            onMapCreated: (GoogleMapController controller) {
              controllerG.complete(controller);
            },
          ),
        ) : Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.clamp,
              colors: [secondaryColor, dominantColor],
            ),
          ),
          child: Center(
            child: SpinKitThreeBounce(color: Colors.white,),
          ),
        )
    );
  }
}
