



import 'package:banklocator/view/DetailsView/page/detailsView.dart';
import 'package:banklocator/view/listOfBanks/page/listOfBanks.dart';
import 'package:flutter/material.dart';

class ListOfBanksRepo {

  navigateToDetailsView(BuildContext context, dynamic snapshot) {
    print('Navigation to Details View');
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => DetailsView(
           snapshot: snapshot,
    )));
  }

}