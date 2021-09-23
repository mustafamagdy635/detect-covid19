import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:detect/widgets1/registerPage.dart';
import 'package:detect/widgets2/bezierContainer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override


  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController email    = new TextEditingController();
  TextEditingController password = new TextEditingController();
  GlobalKey<FormState> FormStateSingin= new GlobalKey();
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

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
  Singin()async{
    var formdate =FormStateSingin.currentState;
    if(formdate.validate()){
      var data ={
        "Email":email.text,
        "Password":password.text
      };
      var url="http://10.0.2.2/detect-covid19/login.php";
      var response= await  http.post(url,body:data);
      var responsebody =jsonDecode(response.body);
      if (responsebody['status'] == "success") {
        print("valid");
        Navigator.of(context).pushNamed("Home");
      }
      else {print("حرام عليك ");}

    }
    else {
      print('Login Faild');

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
        onPressed: Singin,
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
            'Login ',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          Text('or'),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  Widget _facebookButton() {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff1959a9),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    topLeft: Radius.circular(5)),
              ),
              alignment: Alignment.center,
              child: Text('f',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w400)),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff2872ba),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(5),
                    topRight: Radius.circular(5)),
              ),
              alignment: Alignment.center,
              child: Text('Log in with Facebook',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _createAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => RegisterPage()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Don\'t have an account ?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Register',
              style: TextStyle(
                  color: Colors.black45,
                  fontSize: 13,
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
      key: FormStateSingin,
      child: Column(
        children: <Widget>[
          _entryField("Email", false, email, ValidEmail),
          _entryField("Password", true, password, ValidPassword),
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
              top: -height * .15,
              right: -MediaQuery.of(context).size.width * .4,
              child: BezierContainer()),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: height * .2),
                  _title(),
                  SizedBox(height: 50),
                  _emailPasswordWidget(),
                  SizedBox(height: 20),
                  _submitButton(),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    alignment: Alignment.centerRight,
                    child: Text('Forgot Password ?',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500)),
                  ),
                  _divider(),
                  _facebookButton(),
                  SizedBox(height: height * .055),
                  _createAccountLabel(),
                ],
              ),
            ),
          ),
          Positioned(top: 40, left: 0, child: _backButton()),
        ],
      ),
    ));
  }
}
