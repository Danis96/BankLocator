

import 'package:banklocator/services/HomeService/homeRepo.dart';
import 'package:flutter/material.dart';

class HomeViewModel {

  navigateToListOfBanks(BuildContext context) {
    return HomeRepo().navigateToList(context);
  }

}