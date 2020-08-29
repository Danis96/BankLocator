import 'package:banklocator/utils/marqueeWidget.dart';
import 'package:banklocator/utils/size_config.dart';
import 'package:banklocator/view-model/details-view-model.dart';
import 'package:banklocator/view/DetailsView/widgets/whDialog.dart';
import 'package:flutter/material.dart';

Widget containerDetails(
    String title, text, image, BuildContext context, dynamic snapshot) {
  return GestureDetector(
    onTap: () {
      if (title == 'Meeting Request') {
        DetailsViewModel().emailLaunch(context, snapshot['email']);
      }
      if (title == 'Web Site') {
        DetailsViewModel().webLaunch(snapshot['website']);
      }
      if (title == 'Contact Center') {
        DetailsViewModel().phoneLaunch(snapshot['phone']);
      }
      if (title == 'Address') {
        DetailsViewModel().launchAddress(
            snapshot['location']['lat'], snapshot['location']['long']);
      }
      if (title == 'Work Hours') {
        showMyDialog(context, snapshot);
      }
    },
    child: Container(
      height: SizeConfig.blockSizeVertical * 10,
      margin: EdgeInsets.only(
          left: SizeConfig.blockSizeHorizontal * 5,
          right: SizeConfig.blockSizeHorizontal * 5,
          top: SizeConfig.blockSizeVertical * 0.5),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.4),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: SizeConfig.blockSizeHorizontal * 67,
            padding: EdgeInsets.all(6),
            margin: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: SizeConfig.safeBlockHorizontal * 4,
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                ),
                Container(
                  child: text.length >= 23
                      ? MarqueeWidget(
                          direction: Axis.horizontal,
                          animationDuration: Duration(milliseconds: 4000),
                          backDuration: Duration(milliseconds: 4000),
                          pauseDuration: Duration(milliseconds: 200),
                          child: Text(
                            text,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: SizeConfig.safeBlockHorizontal * 5.5,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      : Flexible(
                          child: Text(
                            text,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: SizeConfig.safeBlockHorizontal * 5.5,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                ),
              ],
            ),
          ),
          Container(
            width: SizeConfig.blockSizeHorizontal * 10,
            margin: EdgeInsets.only(right: SizeConfig.blockSizeHorizontal * 10),
            child: Image.asset(image),
          )
        ],
      ),
    ),
  );
}
