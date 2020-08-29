
import 'package:banklocator/models/workingHoursModel.dart';
import 'package:banklocator/utils/size_config.dart';
import 'package:banklocator/view-model/details-view-model.dart';
import 'package:banklocator/view/DetailsView/widgets/workHoursDays.dart';
import 'package:flutter/material.dart';


List<dynamic> wh = [];
String monday, tuesday, wednesday, thursday, friday, saturday, sunday;

Future<void> showMyDialog(BuildContext context, dynamic snapshot) async {
  /// get the hours
  wh = snapshot['working_hours'].map((data) => WorkingHoursModel.fromJson(data)).toList();

  if(wh.length == 1) {
    monday = '0${wh[0].startHours}' + ':' + '${wh[0].startMinutes}' + '-' + ' ${wh[0].endHours}' + ':' + '${wh[0].endMinutes}';
    tuesday =  'Closed' ;
    wednesday =  'Closed' ;
    thursday =  'Closed' ;
    friday =  'Closed' ;
    saturday =  'Closed' ;
    sunday =  'Closed' ;
  } else if(wh.length == 2) {
    monday = '0${wh[0].startHours}:${wh[0].startMinutes}-${wh[0].endHours}:${wh[0].endMinutes}';
    tuesday =  '0${wh[1].startHours}:${wh[1].startMinutes}-${wh[1].endHours}:${wh[1].endMinutes}';
    wednesday =  'Closed' ;
    thursday =  'Closed' ;
    friday =  'Closed' ;
    saturday =  'Closed' ;
    sunday =  'Closed' ;
  } else if(wh.length == 3) {
    monday = '0${wh[0].startHours}:${wh[0].startMinutes}-${wh[0].endHours}:30';
    tuesday =  '0${wh[1].startHours}:${wh[1].startMinutes}-${wh[1].endHours}:${wh[1].endMinutes}';
    wednesday =  '0${wh[2].startHours}:${wh[2].startMinutes}-${wh[2].endHours}:${wh[2].endMinutes}';
    thursday =  'Closed' ;
    friday =  'Closed' ;
    saturday =  'Closed' ;
    sunday =  'Closed' ;
  } else if(wh.length == 4) {
    monday = '0${wh[0].startHours}:${wh[0].startMinutes}-${wh[0].endHours}:${wh[0].endMinutes}';
    tuesday =  '0${wh[1].startHours}:${wh[1].startMinutes}-${wh[1].endHours}:${wh[1].endMinutes}';
    wednesday = '0${wh[2].startHours}:${wh[2].startMinutes}-${wh[2].endHours}:${wh[2].endMinutes}';
    thursday =  '0${wh[3].startHours}:${wh[3].startMinutes}-${wh[3].endHours}:${wh[3].endMinutes}';
    friday =  'Closed' ;
    saturday =  'Closed' ;
    sunday =  'Closed' ;
  } else if(wh.length == 5) {
    monday = '0${wh[0].startHours}:${wh[0].startMinutes}-${wh[0].endHours}:${wh[0].endMinutes}';
    tuesday =  '0${wh[1].startHours}:${wh[1].startMinutes}-${wh[1].endHours}:${wh[1].endMinutes}';
    wednesday =  '0${wh[2].startHours}:${wh[2].startMinutes}-${wh[2].endHours}:${wh[2].endMinutes}';
    thursday =  '0${wh[3].startHours}:${wh[3].startMinutes}-${wh[3].endHours}:${wh[3].endMinutes}';
    friday = '0${wh[4].startHours}:${wh[4].startMinutes}-${wh[4].endHours}:${wh[4].endMinutes}';
    saturday =  'Closed' ;
    sunday =  'Closed' ;
  } else if(wh.length == 6) {
    monday = '0${wh[0].startHours}:${wh[0].startMinutes}-${wh[0].endHours}:${wh[0].endMinutes}';
    tuesday =  '0${wh[1].startHours}:${wh[1].startMinutes}-${wh[1].endHours}:${wh[1].endMinutes}';
    wednesday =  '0${wh[2].startHours}:${wh[2].startMinutes}-${wh[2].endHours}:${wh[2].endMinutes}';
    thursday =  '0${wh[3].startHours}:${wh[3].startMinutes}-${wh[3].endHours}:${wh[3].endMinutes}';
    friday = '0${wh[4].startHours}:${wh[4].startMinutes}-${wh[4].endHours}:${wh[4].endMinutes}';
    saturday =  '0${wh[5].startHours}:${wh[5].startMinutes}-${wh[5].endHours}:${wh[5].endMinutes}';
    sunday =  'Closed' ;
  } else if(wh.length == 7) {
    monday = '0${wh[0].startHours}:0${wh[0].startMinutes}-${wh[0].endHours}:${wh[0].endMinutes}';
    tuesday =  '0${wh[1].startHours}:0${wh[1].startMinutes}-${wh[1].endHours}:${wh[1].endMinutes}';
    wednesday = '0${wh[2].startHours}:0${wh[2].startMinutes}-${wh[2].endHours}:${wh[2].endMinutes}';
    thursday =  '0${wh[3].startHours}:0${wh[3].startMinutes}-${wh[3].endHours}:${wh[3].endMinutes}';
    friday = '0${wh[4].startHours}:0${wh[4].startMinutes}-${wh[4].endHours}:${wh[4].endMinutes}';
    saturday =  '${wh[5].startHours}:0${wh[5].startMinutes}-${wh[5].endHours}:0${wh[5].endMinutes}';
    sunday =  '${wh[6].startHours}:0${wh[6].startMinutes}-${wh[6].endHours}:0${wh[6].endMinutes}';
  }
  print('$monday, $tuesday, $wednesday, $thursday, $friday, $saturday, $sunday');

  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(8.0)), //this right here
          child: Container(
            color: dominantColor.withOpacity(0.9),
            height: SizeConfig.blockSizeVertical * 70,
            width: SizeConfig.blockSizeHorizontal * 90,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// modal headline
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text('Work Hours', style: TextStyle(
                                color: Colors.white,
                                fontSize: SizeConfig.safeBlockHorizontal * 5.5
                            ),),
                          ),
                          GestureDetector(
                            onTap: () => DetailsViewModel().navigateBack(context),
                            child: Container(
                              child: Image.asset('assets/ic_close.png'),
                            ),
                          )
                        ],
                      ),
                    ),
                    /// kartice
                    Container(
                      margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 3),
                      child: Column(
                        children: [
                          workHoursDays('Monday', monday),
                          workHoursDays('Tuesday', tuesday),
                          workHoursDays('Wednesday', wednesday),
                          workHoursDays('Thursday', thursday),
                          workHoursDays('Friday', friday),
                          workHoursDays('Saturday', saturday),
                          workHoursDays('Sunday', sunday),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      });
}
