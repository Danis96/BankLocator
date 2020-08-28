import 'package:banklocator/utils/colors.dart';
import 'package:banklocator/utils/emptyContainer.dart';
import 'package:banklocator/utils/marqueeWidget.dart';
import 'package:banklocator/utils/size_config.dart';
import 'package:banklocator/view-model/details-view-model.dart';
import 'package:flutter/material.dart';

class DetailsView extends StatelessWidget {
  final dynamic snapshot;

  DetailsView({this.snapshot});

  final secondaryColor = AppColors().secondaryColor;
  final dominantColor = AppColors().dominantColor;
  var firstAddress;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            tileMode: TileMode.clamp,
            colors: [secondaryColor, dominantColor],
          ),
        ),
        child: Scaffold(
          resizeToAvoidBottomPadding: false,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  tileMode: TileMode.clamp,
                  colors: [secondaryColor, dominantColor],
                ),
              ),
            ),
            leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () => DetailsViewModel().navigateBack(context)),
            title: Text('Location'.toUpperCase()),
            centerTitle: true,
          ),
          body: Container(
            child: Column(
              children: [
                headerContainer(snapshot),
                Container(
                  child: Column(
                    children: [
                      snapshot['phone'] == null
                          ? EmptyContainer()
                          : containerDetails('Contact Center',
                              snapshot['phone'], 'assets/ic_phone.png', context, snapshot),
                      snapshot['phone'] == null
                          ? EmptyContainer()
                          : containerDetails('Work Hours', snapshot['phone'],
                              'assets/ic_clock.png', context, snapshot)
                    ],
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(top: SizeConfig.blockSizeVertical * 2),
                  child: Column(
                    children: [
                      containerDetails(
                          'Address',
                          DetailsViewModel()
                              .splitAddress(snapshot, firstAddress),
                          'assets/ic_location.png', context, snapshot),
                      containerDetails('Meeting Request', snapshot['email'],
                          'assets/ic_address.png', context, snapshot),
                      containerDetails(
                          'Web Site', snapshot['website'], 'assets/ic_web.png', context, snapshot),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget containerDetails(String title, text, image, BuildContext context, dynamic snapshot) {
  return GestureDetector(
    onTap: () {
       if(title == 'Meeting Request') {
         DetailsViewModel().emailLaunch(context, snapshot['email']);
       }
       if(title == 'Web Site') {
         DetailsViewModel().webLaunch(snapshot['website']);
       }
       if(title == 'Contact Center') {
         DetailsViewModel().phoneLaunch(snapshot['phone']);
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
                  child: text.length >= 27
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
                child: Text(
                  snapshot['name'],
                  style: TextStyle(
                      fontSize: SizeConfig.safeBlockHorizontal * 6,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: Text(
                  snapshot['address'],
                  style: TextStyle(
                      fontSize: SizeConfig.safeBlockHorizontal * 4.5,
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
