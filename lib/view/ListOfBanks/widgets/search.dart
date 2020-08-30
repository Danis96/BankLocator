import 'package:banklocator/models/searchModel.dart';
import 'package:banklocator/utils/colors.dart';
import 'package:banklocator/utils/size_config.dart';
import 'package:banklocator/view/HomePage/page/home.dart';
import 'package:banklocator/view/ListOfBanks/page/listOfBanks.dart';
import 'package:banklocator/view/ListOfBanks/widgets/bankIconCard.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:search_page/search_page.dart';

final secondaryColor = AppColors().secondaryColor;

goToTheMapSearch(dynamic bank, BuildContext context) {
  selectedIndex = 1;
  lat = bank['lat'];
  long = bank['long'];
  Navigator.of(context)
      .push(PageTransition(child: Home(), type: PageTransitionType.fade));
}


Widget searchBar(List<SearchModel> list, BuildContext context) {



  return Container(

    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      color: Colors.white,
    ),
    margin: EdgeInsets.only( top: SizeConfig.blockSizeVertical * 0.5 ,left: SizeConfig.blockSizeHorizontal * 8, right: SizeConfig.blockSizeHorizontal * 8),
      child: ListTile(
        leading: Icon(Icons.search),
        onTap: () =>
              showSearch(
                context: context,
                delegate: SearchPage<SearchModel>(
                  items: list,
                  searchLabel: "Search bank's or ATM's",
                  suggestion: Center(
                    child: Text("Filter bank's or atm's by name or address"),
                  ),
                  barTheme: ThemeData.dark(),
                  failure: Center(
                    child: Text("No bank's or ATM's found"),
                  ),
                  filter: (bank) => [
                    bank.name,
                    bank.address,
                  ],
                  builder: (bank) => GestureDetector(
                    onTap: () {
                      list = [];
                      goToTheMapSearch(bank.location, context);
                    },
                    child: ListTile(
                      leading: bankIcon(bank.type),
                      title: Text(bank.name),
                      subtitle: Text(bank.address),
                    ),
                  ),
                ),
              ),
        )
      );
}
