import 'package:banklocator/services/geolocationService.dart';
import 'package:banklocator/utils/colors.dart';
import 'package:banklocator/utils/decoration.dart';
import 'package:banklocator/utils/size_config.dart';
import 'package:banklocator/view/HomePage/widgets/bottomBar.dart';
import 'package:banklocator/view/ListOfBanks/page/listOfBanks.dart';
import 'package:banklocator/view/MapView/page/mapView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

 int selectedIndex = 1;

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final secondaryColor = AppColors().secondaryColor;
  final dominantColor = AppColors().dominantColor;
  final btnColor = AppColors().btnGreen;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }


  List<Widget> pages = [
       MapMy(),
       MapPage(),
       ListOfBanksScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final locatorService = GeoLocatorService();
    return FutureProvider(
        create: (context) => locatorService.getLocation(),
     child: Container(
      decoration: decoration(),
      child: Scaffold(
        bottomNavigationBar: bottomBar(selectedIndex, btnColor, _onItemTapped),
        backgroundColor: Colors.transparent,
        body:
        Container(child: pages.elementAt(selectedIndex))
      ),
    ));
  }
}
