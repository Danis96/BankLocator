import 'package:banklocator/models/searchModel.dart';
import 'package:banklocator/services/bankApi.dart';
import 'package:banklocator/utils/colors.dart';
import 'package:banklocator/utils/decoration.dart';
import 'package:banklocator/utils/size_config.dart';
import 'package:banklocator/view/HomePage/page/home.dart';
import 'package:banklocator/view/ListOfBanks/widgets/listOfItems.dart';
import 'package:banklocator/view/ListOfBanks/widgets/search.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

String bankApi = BankApi().bankApi;
double lat, long;

class ListOfBanksScreen extends StatelessWidget {
  final secondaryColor = AppColors().secondaryColor;
  final dominantColor = AppColors().dominantColor;
  final btnColor = AppColors().btnGreen;
  final cardColor = AppColors().cardColor;

  goToTheMap(dynamic bank, BuildContext context) {
    selectedIndex = 1;
    lat = bank['location']['lat'];
    long = bank['location']['long'];
    Navigator.of(context)
        .push(PageTransition(child: Home(), type: PageTransitionType.fade));
  }

  List<SearchModel> list = [];
  String _selectedItemText = "Our Selection Item";

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
                decoration: decoration()
              ),
              title: Text('Mobile Assignment'),
              centerTitle: true,
            ),
            body: GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(new FocusNode());
              },
              child: Container(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    searchBar(list, context),
                     listOfItems(list, goToTheMap, cardColor),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}

