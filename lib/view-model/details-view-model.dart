



import 'package:banklocator/services/DetailsViewService/detailsRepo.dart';
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

  launchAddress(double lat, lang) {
    return DetailsRepo().launchLocation(lat, lang);
  }

  calculateWorkHours(dynamic snapshot) {
    return DetailsRepo().calculatingStatus(snapshot);
  }




}