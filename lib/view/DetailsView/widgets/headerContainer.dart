import 'package:banklocator/utils/size_config.dart';
import 'package:flutter/material.dart';

Widget headerContainer(dynamic snapshot) {
  return
    /// image name address
    Container(
      margin: EdgeInsets.only(
          left: SizeConfig.blockSizeHorizontal * 5,
          right: SizeConfig.blockSizeHorizontal * 5),
      height: SizeConfig.blockSizeVertical * 15,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// image
          Container(
            child: snapshot['type'] == 'atm'
                ? Container(child: Image.asset('assets/ic_pin_atm.png'))
                : Container(
//                               height: SizeConfig.blockSizeVertical * 15,
                child: Image.asset(
                  'assets/ic_pin_branch.png',
                )),
          ),

          /// name adress
          Container(
            margin: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: SizeConfig.blockSizeHorizontal * 70,
                  child: Text(
                    snapshot['name'],
                    style: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 5.5,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  width: SizeConfig.blockSizeHorizontal * 70,
                  child: Text(
                    snapshot['address'],
                    overflow: TextOverflow.visible,
                    style: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 4,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
}
