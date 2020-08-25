import 'package:banklocator/view/HomePage/page/home.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());


 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bank Locator',
      home: Home()
    );
  }
}