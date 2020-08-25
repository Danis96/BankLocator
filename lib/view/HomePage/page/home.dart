import 'package:banklocator/utils/colors.dart';
import 'package:banklocator/utils/size_config.dart';
import 'package:banklocator/view/HomePage/widgets/bankCard.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final secondaryColor = AppColors().secondaryColor;
  final dominantColor = AppColors().dominantColor;
  final btnColor = AppColors().btnGreen;

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
          bottomNavigationBar: Row(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                          height: SizeConfig.blockSizeHorizontal * 11,
                          width: SizeConfig.blockSizeHorizontal * 33.3,
                          child: RaisedButton(
                            color: btnColor,
                            onPressed: () => {},
                            child: Text(
                              'My location',
                              style: TextStyle(
                                  fontSize: SizeConfig.safeBlockHorizontal * 4),
                            ),
                          )),
                      Container(
                        height: SizeConfig.blockSizeHorizontal * 11,
                        width: SizeConfig.blockSizeHorizontal * 33.3,
                        child: RaisedButton(
                          color: btnColor,
                          onPressed: () => {},
                          child: Text(
                            'Location',
                            style: TextStyle(
                                fontSize: SizeConfig.safeBlockHorizontal * 4),
                          ),
                        ),
                      ),
                      Container(
                        height: SizeConfig.blockSizeHorizontal * 11,
                        width: SizeConfig.blockSizeHorizontal * 33.3,
                        child: RaisedButton(
                          color: btnColor,
                          onPressed: () => {},
                          child: Text(
                            'List',
                            style: TextStyle(
                                fontSize: SizeConfig.safeBlockHorizontal * 4),
                          ),
                        ),
                      )
                    ],
          ),
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
              title: Text('Mobile Assignment'),
              centerTitle: true,
            ),
            body: ListView(
              shrinkWrap: true,
              children: [
                Container(
                  child: ListView.builder(
                      
                      shrinkWrap: true,
                      itemCount: 8,
                      itemBuilder: (BuildContext context, int number) {
                        return bankCard(context);
                      }),
                ),
              ],
            )),
      ),
    );
  }
}
