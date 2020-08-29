import 'package:banklocator/utils/colors.dart';
import 'package:banklocator/utils/size_config.dart';
import 'package:flutter/material.dart';

Color dominantColor = AppColors().dominantColor;
Color secondaryColor = AppColors().secondaryColor;

Widget workHoursDays(String day, String workHour) {
  return Container(
    decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          tileMode: TileMode.clamp,
          end: Alignment.centerRight,
          colors: [dominantColor, secondaryColor, dominantColor],
        ),
        border: Border(
            top: BorderSide(
                color: Colors.black26,
                width: 0.3
            ),
            bottom: BorderSide(
                color: Colors.black26,
                width: 0.3
            )
        )
    ),
    height: SizeConfig.blockSizeVertical * 7,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 2),
          child: Text(day, style: TextStyle(
              color: Colors.black45,
              fontWeight: FontWeight.w500,
              fontSize: SizeConfig.safeBlockHorizontal * 4.5
          ),),
        ),
        Container(
          margin: EdgeInsets.only(right: SizeConfig.blockSizeHorizontal * 2),
          child: Text(workHour, style: TextStyle(
              color: Colors.white,
              fontSize: SizeConfig.safeBlockHorizontal * 3
          )),
        )
      ],
    ),
  );
}
