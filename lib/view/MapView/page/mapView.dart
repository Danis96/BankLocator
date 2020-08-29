


import 'package:banklocator/models/bankModel.dart';
import 'package:banklocator/services/markerService.dart';
import 'package:banklocator/utils/size_config.dart';
import 'package:banklocator/view/ListOfBanks/page/listOfBanks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';


class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final markerService = MarkerService();
    
//    final currentPosition = Provider.of<Position>(context);
//    final banksProvider = Provider.of<Future<List<BankModel>>>(context);
//    print(banksProvider);
    return
//      FutureProvider(
//      create: (context) => banksProvider,
//      child:
      Scaffold(
        body:  Column(
          children: [
            Container(
              height: SizeConfig.blockSizeVertical * 92,
              child: GoogleMap(
                markers: Set<Marker>.of(markers),
                initialCameraPosition: CameraPosition(
                  target: LatLng(43.9159, 17.6791),
                  zoom: 7.0,
                ),
                zoomGesturesEnabled: true,
              ),
            )
          ],
        )
//      ),
    );
  }
}
