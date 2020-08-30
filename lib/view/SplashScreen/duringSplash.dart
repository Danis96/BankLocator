

import 'package:banklocator/services/getApi.dart';
import 'package:banklocator/services/markerService.dart';
import 'package:banklocator/utils/emptyContainer.dart';
import 'package:flutter/material.dart';

var markers;


Widget duringSplash(BuildContext context) {
  final markerService = MarkerService();
  return FutureBuilder(
      future: fetchBanks(),
      builder: (context, snapshot) {
        if(snapshot.hasData) {
          markers = markerService.getMarkers(snapshot.data, context);
        }
        return EmptyContainer();
      });
}