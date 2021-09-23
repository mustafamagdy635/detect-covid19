import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class mydrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [

          UserAccountsDrawerHeader(accountName:Text( 'mustaf'),
            accountEmail:Text('mustafamagdy365@gamil.com'),
            currentAccountPicture:CircleAvatar(child: Icon(Icons.person)),
            decoration:BoxDecoration(
              color:Colors.blue,
            ) ,
          ),
          ListTile(
            title: Text('Home'),
            leading: Icon(Icons.home),
            onTap: (){
              Navigator.of(context).pushNamed('Home_page');
            },
          ),
          ListTile(
            title: Text('Logout '),
            leading: Icon(Icons.login),
            onTap: (){
              Navigator.of(context).pushNamed('logout');
            },
          ),
        ],
      ),
    );

  }
}

