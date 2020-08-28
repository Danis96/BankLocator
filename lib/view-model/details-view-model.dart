



import 'package:banklocator/repository/DetailsViewRepository/detailsRepo.dart';
import 'package:banklocator/repository/HomeRepository/homeRepo.dart';
import 'package:flutter/material.dart';

class DetailsViewModel {

  navigateBack(BuildContext context) {
    return DetailsRepo().backNavigation(context);
  }

  splitAddress(dynamic snapshot, var firstAddress) {
    return DetailsRepo().splitAddress(snapshot, firstAddress);
  }

  emailLaunch(BuildContext context, String emailBank) {
     return DetailsRepo().launchEmail(context, emailBank);
  }

  webLaunch(String webBank) {
    return DetailsRepo().launchWeb(webBank);
  }

  phoneLaunch(String phoneBank) {
    return DetailsRepo().launchPhone(phoneBank);
  }

}