

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class DetailsRepo {
  backNavigation(BuildContext context) {
    print('Navigation to List - Back');
    Navigator.of(context).pop();
  }

  splitAddress(dynamic snapshot, var firstAddress) {
    var addressSplit = snapshot['address'];
    firstAddress = addressSplit.split(',');
    print(firstAddress[0]);
    return firstAddress[0];
  }

  launchEmail(BuildContext context, String emailBank) async {
    String email = emailBank;
    String subject = 'Contacting';
    String body = 'Hi, how can we help you?';
    if (await canLaunch("mailto:$email")) {
      await launch("mailto:$email?subject=$subject&body=$body");
    } else {
      print('Email launch error');
    }
  }

   Future launchWeb(String webBank) async {
    var _url = webBank;
    if (await canLaunch(_url)) {
      await launch(_url);
    } else {
      print('Cannot open: ' + _url);
    }
   }
   
   Future launchPhone(String phoneBank) async {
      var phone = phoneBank;
      if(await canLaunch(phone)) {
        launch('tel://${phone}');
      } else {
        print('Cannot call');
      }
   }

}