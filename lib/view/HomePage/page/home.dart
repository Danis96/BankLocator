import 'package:banklocator/utils/colors.dart';
import 'package:banklocator/utils/size_config.dart';
import 'package:banklocator/view-model/home-view-model.dart';
import 'package:banklocator/view/HomePage/widgets/bottomButton.dart';
import 'package:banklocator/view/listOfBanks/widgets/bankCard.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  final secondaryColor = AppColors().secondaryColor;
  final dominantColor = AppColors().dominantColor;
  final btnColor = AppColors().btnGreen;

  printF(BuildContext context) {
    return print('Danis1');
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          tileMode: TileMode.clamp,
          colors: [secondaryColor, dominantColor],
        ),
      ),
      child: Scaffold(
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomButton(btnColor: btnColor, text: 'My location',  function: printF),
            BottomButton(btnColor: btnColor, text: 'Location',  function: printF),
            BottomButton(btnColor: btnColor, text: 'List',  function: HomeViewModel().navigateToListOfBanks)
          ],
        ),
        backgroundColor: Colors.transparent,
        body: Container(
          child: Center(
            child: Text('Ovdje ide mapa'),
          ),
        ),
      ),
    );
  }
}
