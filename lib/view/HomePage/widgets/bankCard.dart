

import 'package:banklocator/utils/size_config.dart';
import 'package:flutter/material.dart';

Widget bankCard(BuildContext context) {
  SizeConfig().init(context);
   return Container(
     height: SizeConfig.blockSizeVertical * 20,
       width: SizeConfig.blockSizeHorizontal * 80,
       color: Colors.white,
       child: Text('Damnis'),
   );
}