import 'dart:convert';

import 'package:detect/widgets1/LoginPage.dart';
import 'package:detect/widgets2/bezierContainer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key, this.title}) : super(key: key);

  final String title;


  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  TextEditingController name = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController confirmpassword = new TextEditingController();
  GlobalKey<FormState> formstatesignup = new GlobalKey<FormState>();

  String ValidName(val) {
    if (val.trim().isEmpty) {
      return ' user name cant be Empty';
    }
    if (val.trim().length < 4) {
      return ' user name cant be less than 4';
    }

    if (val.trim().length > 20) {
      return ' user name cant be more 20 ';
    }
  }

  String ValidPassword(val) {
    if (val.trim().isEmpty) {
      return ' user password cant be Empty';
    }
    if (val.trim().length < 4) {
      return ' user password cant be less than 4';
    }

    if (val.trim().length > 20) {
      return ' user password cant be more 20 ';
    }
  }

  String validConfirmPassWord(String val) {
    if (val != password.text) {
      return 'password not equel ';
    }
  }

  String ValidEmail(val) {
    if (val.trim().isEmpty) {
      return ' user Email cant be Empty';
    }
    if (val.trim().length < 4) {
      return ' user Email cant be less than 4';
    }

    if (val.trim().length > 20) {
      return ' user Email cant be more 20 ';
    }
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(val)) {
      return 'example@gmail.com';
    }
  }

  Signup() async {
    var formdate = formstatesignup.currentState;
    if (formdate.validate()) {
      var data = {
        "Name": name.text,
        "Email": email.text,
        "Password": password.text,
      };
      var url = "http://10.0.2.2/detect-covid19/add.php";
      var response = await http.post(url, body: data);
      var respnsebody = jsonDecode(response.body);
      if (respnsebody['status'] == "success") {
        print(' valid');
      }
    } else {
      print('Not valid');
    }
  }

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Back',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }
  TextFormField _entryField(String title, bool isPassword,
      TextEditingController myController, myValid) {
    return TextFormField(
      controller: myController,
      obscureText: isPassword,
      validator: myValid,
      autovalidate: true,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(4),
          border: InputBorder.none,
          fillColor: Colors.indigo[50],
          hintText: title,
          filled: true,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.5),
              borderSide: BorderSide(
                  color: Colors.grey[500], style: BorderStyle.solid, width: 1)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.blue, style: BorderStyle.solid, width: 1))),
    );
  }



  Widget _submitButton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: RaisedButton(
        onPressed: Signup,
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(vertical: 15),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.blueAccent[100], Colors.indigo[400]]),
          ),
          child: Text(
            'Register ',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _loginAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
      child: Container(
        //margin: EdgeInsets.symmetric(vertical: 20),
        // padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Already have an account ?',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Login',
              style: TextStyle(
                  color: Colors.black45,
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'C',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
          children: [
            WidgetSpan(
              child: Icon(
                Icons.coronavirus_sharp,
                size: 30,
                color: Colors.green[600],
              ),
            ),
            TextSpan(
              text: 'vid',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
              ),
            ),
            TextSpan(
              text: ' Sp',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            WidgetSpan(
              child: Icon(
                Icons.coronavirus_sharp,
                size: 30,
                color: Colors.green[600],
              ),
            ),
            TextSpan(
              text: ' t',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
          ]),
    );
  }

  Widget _emailPasswordWidget() {
    return Form(
      key: formstatesignup,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          _entryField("Name", false, name, ValidName),
          SizedBox(
            height: 50,
          ),
          _entryField("Email", false, email, ValidEmail),
          SizedBox(
            height: 50,
          ),
          _entryField("Password", true, password, ValidPassword),
          SizedBox(
            height: 50,
          ),
          _entryField(
              "confirm password", true, confirmpassword, validConfirmPassWord),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -MediaQuery.of(context).size.height * .15,
              right: -MediaQuery.of(context).size.width * .3,
              child: BezierContainer(),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: height * .2),
                    _title(),
                    SizedBox(
                      height: 20,
                    ),
                    _emailPasswordWidget(),
                    SizedBox(
                      height: 5,
                    ),
                    _submitButton(),
                    SizedBox(height: height * .14),
                    _loginAccountLabel(),
                  ],
                ),
              ),
            ),
            Positioned(top: 40, left: 0, child: _backButton()),
          ],
        ),
      ),
    );
  }
}
