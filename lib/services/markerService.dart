import 'dart:async';

import 'package:banklocator/view-model/listOfBanks-view-model.dart';
import 'package:banklocator/view/ListOfBanks/page/listOfBanks.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class MarkerService {
  List<Marker> getMarkers(dynamic snapshot, BuildContext context) {
    ImageConfiguration configuration = createLocalImageConfiguration(context);
    var markers = List<Marker>();
    snapshot.forEach((bank) async {
      Marker marker = Marker(
        markerId: MarkerId(bank['name']),
        draggable: false,
        infoWindow: InfoWindow(
          onTap: () => ListOfBanksViewModel().navigateToDetailsView(context, bank),
          title: bank['name'],
          snippet: bank['address'],
        ),
        icon: bank['type'] == 'atm'
            ? await BitmapDescriptor.fromAssetImage(
                configuration, 'assets/ic_pin_atm.png')
            : await BitmapDescriptor.fromAssetImage(
                configuration, 'assets/ic_pin_branch.png'),
        position: LatLng(bank['location']['lat'], bank['location']['long']),
      );
      markers.add(marker);
    });

    return markers;
  }
}
