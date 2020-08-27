import 'package:banklocator/utils/size_config.dart';
import 'package:flutter/material.dart';

Widget bankIcon(String type) {
  return Container(
      margin: EdgeInsets.only(
          right: SizeConfig.blockSizeHorizontal * 2),
      child: type == 'atm'
          ? Image.asset('assets/ic_atm.png')
          : Image.asset('assets/ic_branch.png'));
}