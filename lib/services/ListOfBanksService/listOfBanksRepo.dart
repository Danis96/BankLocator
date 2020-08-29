



import 'package:banklocator/models/locationModel.dart';
import 'package:banklocator/view/DetailsView/page/detailsView.dart';
import 'package:banklocator/view/listOfBanks/page/listOfBanks.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class ListOfBanksRepo {

  List<dynamic> locations = [];

  navigateToDetailsView(BuildContext context, dynamic snapshot) {
    print('Navigation to Details View');
    Navigator.of(context).push(PageTransition(type: PageTransitionType.fade, child: DetailsView(
      snapshot: snapshot,
    )));
  }


  fetchLocation(dynamic snapshot) {

//    locations = snapshot['location'].map((data) => Location.fromJson(data)).toList();
//    print('Locations ' + locations.toString());
     print(snapshot['location']);

  }

}

