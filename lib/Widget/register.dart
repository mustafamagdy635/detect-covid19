import 'dart:convert';
import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class register extends StatefulWidget {
  @override
  _register createState() => _register();
}

class _register extends State<register> {
  /*              Form Controller     (Name ,Password,Email  )  */
  TextEditingController Name = new TextEditingController();
  TextEditingController Password = new TextEditingController();
  TextEditingController Email = new TextEditingController();
  GlobalKey<FormState> formstateregister = new GlobalKey<FormState>();

  /*                      validation in Fields                      */

  // validation in user name
  String validName(String val) {
    if (val.trim().isEmpty) {
      return 'the Filed cant be empty';
    }
  }

  // validation  in Password
  String validpass(String val) {
    if (val.trim().isEmpty) {
      return 'the Filed cant be empty';
    }
    if (val.trim().length < 8) {
      ' plz enter 8 character';
    }
  }

  // validation  in Email
  String validEmail(String val) {
    if (val.trim().isEmpty) {
      return 'the Filed cant be empty';
    }
  }
  closth() async {

    var data = {
      "Password": Password.text,
      "Name": Name.text,
      "Email": Email.text,
    };
    var url = "http://10.0.2.2/Restuarant/add.php";
    var response = await http.post(url, body: data);
    var responsebody = jsonDecode(response.body);
    if (responsebody['status'] == "success") {
      print(' valid');
    }
  }


  @override
  Widget build(BuildContext context) {
    var mdw = MediaQuery
        .of(context)
        .size
        .width;
   return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Stack(children: [

        SingleChildScrollView(
            child: Column(
              children: [
                bulidFormBox(mdw),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Column(
                    children: [
                      SizedBox(height: 24),
                      RaisedButton(
                        padding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        color: Colors.blue,
                        onPressed: closth,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('حفظ',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18)),
                            Icon(Icons.arrow_forward_sharp,
                                color: Colors.white)
                          ],),),
                    ],),
                ),
              ],)),
      ])

    );
  }
  bulidFormBox(double mdw){
    return Center(
      child: Container(
        height: 350,
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: Colors.black,
              spreadRadius: .1,
              blurRadius: 1,
              offset: Offset(1, 1))
        ]),
        child: Form(
            key: formstateregister,
            child: Container(
              // margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  buildTextFormFieldAll(
                    "  Name ",
                    false,
                    Name,
                    validName,
                  ),
                  buildTextFormFieldAll("Password", true, Password, validpass),

                  buildTextFormFieldAll("Email", false, Email, validEmail),

                  Container(margin: EdgeInsets.only(bottom: 15),),


                ],),
            )),),
    );}
/*
  bulidFormBox(double mdv) {
    return Center(
      child: Container(
        height: 400,
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.white70, boxShadow: [
          BoxShadow(
            color: Colors.black,
            spreadRadius: 20,
            blurRadius: 10,
            offset: Offset(1, 1),
          ),
        ]),
        child: Form(
          key: formstateregister,
          child: Container(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  buildTextFormFieldAll(
                    "  Name ",
                    false,
                    Name,
                    validName,
                  ),
                  buildTextFormFieldAll("Password", true, Password, validpass),
                  buildTextFormFieldAll("Email", false, Email, validEmail),
                ]),
            //  buildTextFormFieldAll(),
          ),
        ),
      ),
    );
  }
*/
  TextFormField buildTextFormFieldAll(String myhinttext, bool pass,
      TextEditingController myController, myvalid) {
    return TextFormField(
      controller: myController,
      obscureText: pass,
      validator: myvalid,
      autovalidate: true,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(4),
          hintText: myhinttext,
          filled: true,
          fillColor: Colors.grey[200],
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.5),
              borderSide: BorderSide(
                  color: Colors.grey[500], style: BorderStyle.solid, width: 1)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.blue, style: BorderStyle.solid, width: 1))),
    );
  }
}
