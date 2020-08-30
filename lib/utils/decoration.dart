

import 'package:banklocator/utils/colors.dart';
import 'package:flutter/material.dart';

final secondaryColor = AppColors().secondaryColor;
final dominantColor = AppColors().dominantColor;

BoxDecoration decoration() {
   return  BoxDecoration(
     gradient: LinearGradient(
       begin: Alignment.topCenter,
       end: Alignment.bottomCenter,
       tileMode: TileMode.clamp,
       colors: [secondaryColor, dominantColor],
     ),
   );
}