import 'package:banklocator/models/workingHoursModel.dart';
import 'package:banklocator/notifiers/statusNotifier.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsRepo {
  int monday = 1, tuesday = 2, wednesday = 3, thursday = 4, friday = 5;
  List<dynamic> workingHours = [];
  String status;

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
    if (await canLaunch(phone)) {
      launch('tel://${phone}');
    } else {
      print('Cannot call');
    }
  }

  Future launchLocation(double lay, long) async {
     final url = 'https://www.google.com/maps/search/api=1query=$lay,$long';
     if (await canLaunch(url)) {
    launch(url);
    } else {
    print('Could not launch $url');
    }
  }

   calculatingStatus(dynamic snapshot) {
     workingHours = snapshot['working_hours']
         .map((data) => WorkingHoursModel.fromJson(data))
         .toList();

    for(var i = 0; i < workingHours.length; i++) {
      if (DateTime.now().weekday == i + 1) {
        print('Meow');
        final workStartTime = DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
            workingHours[i - 1].startHours,
            workingHours[i - 1].startMinutes);
        final workEndTime = DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
            workingHours[i - 1].endHours,
            workingHours[i - 1].endMinutes);
        final currentTime = DateTime.now();
        if (currentTime.isAfter(workStartTime) &&
            currentTime.isBefore(workEndTime)) {
          print('Open Day ' + i.toString());
          return status = 'Opened';
        } else {
          print('Closed Day ' + i.toString());
          return status = 'Closed';
        }
      } else {
        return status = 'Closed';
      }
    }
  }



}
