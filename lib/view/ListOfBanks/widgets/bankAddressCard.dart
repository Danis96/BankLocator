import 'package:banklocator/utils/size_config.dart';
import 'package:flutter/material.dart';

Widget bankAddress(String address) {
  return  Container(
    height: SizeConfig.blockSizeVertical * 5,
    margin: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 5),
    alignment: Alignment.centerLeft,
    child: Text(address,
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: SizeConfig.safeBlockHorizontal * 3.7)),
  );
}