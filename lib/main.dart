import 'package:detect/widgets1/Home.dart';
import 'package:detect/widgets1/LoginPage.dart';
import 'package:detect/widgets1/homePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
return MaterialApp(
  debugShowCheckedModeBanner: false,
  title: 'navigation',
  routes: {
    'logout':(cotext){
      return LoginPage();},
    'Home':(cotext){
      return Home();},
  },
  home: Home(),

);
  }

}

