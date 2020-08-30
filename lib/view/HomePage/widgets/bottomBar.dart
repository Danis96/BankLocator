

import 'package:flutter/material.dart';

Widget bottomBar(int selectedIndex, Color btnColor, Function onItemTapped) {
   return BottomNavigationBar(
     currentIndex: selectedIndex,
     selectedItemColor: Colors.white,
     onTap: onItemTapped,
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
   );
}