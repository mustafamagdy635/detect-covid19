import 'package:detect/widgets2/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _Home  createState() => _Home();
}

class _Home extends State<Home>{




  @override
  Widget build(BuildContext context) {

    return   Scaffold(
      appBar: AppBar(title: Text('Main page'),backgroundColor: Colors.red,actions: [


      ],
        centerTitle: true,
      ),
    drawer: mydrawer() ,

      body:Container(),


    );


  }
}



