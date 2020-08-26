

import 'package:banklocator/repository/HomeRepository/homeRepo.dart';
import 'package:banklocator/view/listOfBanks/page/listOfBanks.dart';
import 'package:flutter/material.dart';

class HomeViewModel {

  navigateToListOfBanks(BuildContext context) {
    return HomeRepo().navigateToList(context);
  }

}