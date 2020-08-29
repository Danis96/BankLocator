import 'package:banklocator/models/workingDaysModel.dart';
import 'package:banklocator/models/workingHoursModel.dart';
import 'package:banklocator/utils/colors.dart';
import 'package:banklocator/utils/emptyContainer.dart';
import 'package:banklocator/utils/marqueeWidget.dart';
import 'package:banklocator/utils/size_config.dart';
import 'package:banklocator/view-model/details-view-model.dart';
import 'package:banklocator/view/DetailsView/widgets/detailsContainer.dart';
import 'package:banklocator/view/DetailsView/widgets/headerContainer.dart';
import 'package:flutter/material.dart';

final secondaryColor = AppColors().secondaryColor;
final dominantColor = AppColors().dominantColor;


class DetailsView extends StatelessWidget {
  final dynamic snapshot;

  DetailsView({this.snapshot});
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
                          : containerDetails(
                              'Contact Center',
                              snapshot['phone'],
                              'assets/ic_phone.png',
                              context,
                              snapshot),
                      snapshot['phone'] == null
                          ? EmptyContainer()
                          : containerDetails(
                              'Work Hours',
                              DetailsViewModel().calculateWorkHours(snapshot),
//                              snapshot['phone'],
                              'assets/ic_clock.png',
                              context,
                              snapshot)
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
                          'assets/ic_location.png',
                          context,
                          snapshot),
                      containerDetails('Meeting Request', snapshot['email'],
                          'assets/ic_address.png', context, snapshot),
                      containerDetails('Web Site', snapshot['website'],
                          'assets/ic_web.png', context, snapshot),
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








