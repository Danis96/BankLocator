import 'package:banklocator/utils/colors.dart';
import 'package:banklocator/utils/emptyContainer.dart';
import 'package:banklocator/utils/size_config.dart';
import 'package:banklocator/view/ListOfBanks/page/listOfBanks.dart';
import 'package:banklocator/view/MapView/page/mapView.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final secondaryColor = AppColors().secondaryColor;

  final dominantColor = AppColors().dominantColor;

  final btnColor = AppColors().btnGreen;

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> pages = [
       EmptyContainer(),
       MapPage(),
       ListOfBanksScreen(),
  ];

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
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          onTap: _onItemTapped,
          backgroundColor: btnColor,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.location_on),
              title: Text('My Location'),
              backgroundColor: btnColor
            ),BottomNavigationBarItem(
              icon: Icon(Icons.location_searching),
              title: Text('Location'),
                backgroundColor: btnColor
            ),BottomNavigationBarItem(
              icon: Icon(Icons.list),
              title: Text('List'),
                backgroundColor: btnColor
            ),
          ],
        ),
//        Row(
//          mainAxisAlignment: MainAxisAlignment.spaceAround,
//          children: [
//            BottomButton(btnColor: btnColor, text: 'My location',  function: printF),
//            BottomButton(btnColor: btnColor, text: 'Location',  function: printF),
//            BottomButton(btnColor: btnColor, text: 'List',  function: HomeViewModel().navigateToListOfBanks)
//          ],
//        ),
        backgroundColor: Colors.transparent,
        body: Container(child: pages.elementAt(_selectedIndex))
      ),
    );
  }
}
