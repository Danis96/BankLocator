import 'package:banklocator/utils/size_config.dart';
import 'package:flutter/material.dart';

Widget bankTitle(String name) {
  return  Container(
      margin:
      EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 5),
      child: Text(
        name,
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: SizeConfig.safeBlockHorizontal * 4.5),
      ));
}