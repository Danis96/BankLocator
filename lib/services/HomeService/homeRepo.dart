



import 'package:banklocator/view/listOfBanks/page/listOfBanks.dart';
import 'package:flutter/material.dart';

class HomeRepo {

  navigateToList(BuildContext context) {
    print('Navigation to List');
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => ListOfBanksScreen()));
  }

}