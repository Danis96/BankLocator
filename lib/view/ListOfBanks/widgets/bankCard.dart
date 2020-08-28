import 'package:banklocator/utils/size_config.dart';
import 'package:banklocator/view/listOfBanks/widgets/bankAddressCard.dart';
import 'package:banklocator/view/listOfBanks/widgets/bankIconCard.dart';
import 'package:banklocator/view/listOfBanks/widgets/bankTitleCard.dart';
import 'package:flutter/material.dart';

Widget bankCard(
    BuildContext context, Color secondaryColor, String name, address, type) {
  SizeConfig().init(context);
  return Container(
    decoration: BoxDecoration(
        color: secondaryColor.withOpacity(0.7),
        borderRadius: BorderRadius.circular(10)),
    margin: EdgeInsets.only(
        top: SizeConfig.blockSizeVertical * 0.5,
        left: SizeConfig.blockSizeHorizontal * 7,
        right: SizeConfig.blockSizeHorizontal * 7),
    child: Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: secondaryColor, borderRadius: BorderRadius.circular(8)),
          height: SizeConfig.blockSizeVertical * 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              bankTitle(name),
              bankIcon(type),
            ],
          ),
        ),
       bankAddress(address),
      ],
    ),
  );
}




