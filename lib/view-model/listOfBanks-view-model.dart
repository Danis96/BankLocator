import 'package:banklocator/services/ListOfBanksService/listOfBanksRepo.dart';
import 'package:flutter/material.dart';

class ListOfBanksViewModel {

  navigateToDetailsView(BuildContext context, dynamic snapshot) {
    return ListOfBanksRepo().navigateToDetailsView(context, snapshot);
  }

}