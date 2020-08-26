

import 'package:banklocator/view/listOfBanks/page/listOfBanks.dart';
import 'package:flutter/material.dart';

class HomeViewModel {

  navigateToListOfBanks(BuildContext context) {
      print('Navigation to List');
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => ListOfBanksScreen()));
  }

}