import 'package:banklocator/utils/size_config.dart';
import 'package:flutter/material.dart';

Widget bankCard(BuildContext context, Color secondaryColor) {
  SizeConfig().init(context);
  return Container(
    decoration: BoxDecoration(
      color: secondaryColor.withOpacity(0.7),
      borderRadius: BorderRadius.circular(10)
    ),
    margin: EdgeInsets.only(
        top: SizeConfig.blockSizeVertical * 0.5,
        left: SizeConfig.blockSizeHorizontal * 7,
        right: SizeConfig.blockSizeHorizontal * 7),

    child: Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.circular(8)
          ),
          height: SizeConfig.blockSizeVertical * 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  margin:
                      EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 5),
                  child: Text('Poslovnica u tuzli', style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: SizeConfig.safeBlockHorizontal * 4.5
                  ),)),
              Container(
                  margin: EdgeInsets.only(
                      right: SizeConfig.blockSizeHorizontal * 2),
                  child: Image.asset('assets/ic_atm.png')),
            ],
          ),
        ),
        Container(
//          color: secondaryColor.withOpacity(0.4),
          height: SizeConfig.blockSizeVertical * 5,
          margin: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 5),
          alignment: Alignment.centerLeft,
          child: Text('Solni trg, 5, Tuzla 75000', style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: SizeConfig.safeBlockHorizontal * 4
          )),
        )
      ],
    ),
  );
}
