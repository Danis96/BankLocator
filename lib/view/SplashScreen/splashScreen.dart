import 'package:banklocator/services/geolocationService.dart';
import 'package:banklocator/services/getApi.dart';
import 'package:banklocator/services/markerService.dart';
import 'package:banklocator/utils/colors.dart';
import 'package:banklocator/utils/emptyContainer.dart';
import 'package:banklocator/utils/size_config.dart';
import 'package:banklocator/view/HomePage/page/home.dart';
import 'package:banklocator/view/SplashScreen/duringSplash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';


class Splash extends StatelessWidget {
  final secondaryColor = AppColors().secondaryColor;

  final dominantColor = AppColors().dominantColor;



  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return  Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            duringSplash(context),
            Container(
              height: SizeConfig.blockSizeVertical * 100,
              child: SplashScreen(
                seconds: 3,
                navigateAfterSeconds: new Home(),
                title: new Text(
                  'Welcome To Bank Locator',
                  style: new TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20.0,
                      color: Colors.white),
                ),
                gradientBackground: new LinearGradient(
                    colors: [secondaryColor, dominantColor],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
                backgroundColor: Colors.white,
                loaderColor: Colors.white,
              ),
            ),
          ],
        ),
      );
  }
}
