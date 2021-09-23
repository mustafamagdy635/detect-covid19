import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Login  extends  StatefulWidget{
  _Loginstats createState() => _Loginstats();

}
class _Loginstats extends State<Login> {

  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  TextEditingController username = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController confirmpassword = new TextEditingController();
  GlobalKey<FormState> formstatesignin = new GlobalKey<FormState>();
  GlobalKey<FormState> formstatesignup = new GlobalKey<FormState>();

  String Validglobal(String val){
    if (val.isEmpty){
      return 'filed form';
    }
  }

  String validUserName(String val){
    if (val.trim() .isEmpty){
      return ' user name cant be Empty';
    }
    if (val.trim() .length< 4){
      return ' user name cant be less than 4';
    }

    if (val.trim() .length> 20){
      return ' user name cant be more 20 ';
    }
  }

  String validPassWord(String val){
    if (val.trim() .isEmpty){
      return ' user password cant be Empty';
    }
    if (val.trim() .length< 4){
      return ' user password cant be less than 4';
    }

    if (val.trim() .length> 20){
      return ' user password cant be more 20 ';
    }
  }
  String validConfirmPassWord(String val) {
    if(val!=password.text){
      return 'password not equel ';
    }
  }
  String validUserEmail(String val){
    if (val.trim() .isEmpty){
      return ' user Email cant be Empty';
    }
    if (val.trim() .length< 4){
      return ' user Email cant be less than 4';
    }

    if (val.trim() .length> 20){
      return ' user Email cant be more 20 ';
    }
    RegExp regex= new RegExp(pattern);
    if(!regex.hasMatch(val)){
      return 'example@gmail.com';
    }
  }
  signup () async{
    var formdate=formstatesignup.currentState;
    if(formdate.validate()){
      var data = {"Email": email.text, "Password": password.text,"username": username.text  };
      var url = "http://10.0.2.2/Restuarant/signup.php" ;
      var response = await http.post(url,body: data) ;
      var responsebody = jsonDecode(response.body) ;

      if (responsebody['status'] == "success") {
        print(responsebody['usersnName']);
      }
    }
    else {
      print('Not valid');
    }
  }
  signin() async {
    var formdate=formstatesignin.currentState;
    if(formdate.validate()){
      var data = {"Email": email.text, "Password": password.text  };
      var url = "http://10.0.2.2/Restuarant/login.php" ;
      var response = await http.post(url,body: data) ;
      var responsebody = jsonDecode(response.body) ;

      if (responsebody['status'] == "success") {
        print(responsebody['usersnName']);
      }
    }
    else {
      print('Not valid');
    }
  }

  TapGestureRecognizer _changesign;
  bool ShowSingin = true;

  @override
  Void initState() {
    _changesign = new TapGestureRecognizer()
      ..onTap = () {
        setState(() {
          ShowSingin = !ShowSingin;
          print(ShowSingin);
        });
      };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mdw = MediaQuery
        .of(context)
        .size
        .width;

    return Scaffold(


      body: Stack(
          children: [


            Container(height: double.infinity, width: double.infinity),

            buildPositionedtop(mdw),
            buildPositionedBottom(mdw),
            SingleChildScrollView(child:

            Column(children: [


              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: SingleChildScrollView(child: Column(children: [
                  Center(child: Container(margin: EdgeInsets.only(
                      top: ShowSingin ? 50 : 2), child: Text(
                    ShowSingin ? "Login" : 'create account',
                    style: TextStyle(color: Colors.white, fontSize: 30),),),),
                  Padding(padding: EdgeInsets.only(top: 20)),
                  Container(
                    height: 100, width: 100, decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black, blurRadius: 4, spreadRadius: 0.1)
                    ],
                  ),

                    child: InkWell(
                      onTap: (){
                        setState(() {
                          ShowSingin =!ShowSingin ;
                        });
                      },
                      child: Stack(
                        children: [
                          Positioned(
                              top: 25,
                              right: 25,
                              child: Icon(
                                  Icons.person, size: 50, color: Colors.white)
                          ),

                          Positioned(
                              top: 35,
                              right: 60,
                              child: Icon(
                                  Icons.arrow_back, size: 30, color: Colors.white)
                          ),
                        ],
                      ),
                    ),

                  ),
                ],),),
              ),

              ShowSingin ? buildFormBoxLogin(mdw) : buildFormBoxregister(mdw),

              Center(child:
              Container(


                child: Column(children: [
                  ShowSingin ? Container(margin: EdgeInsets.only(top: ShowSingin
                      ? 10
                      : 0), child: InkWell(child: Text('Forgotten  password',
                      style: TextStyle(color: Colors.blue, fontSize: 18)),
                      onTap: () {})) : SizedBox(),
                  SizedBox(height: 24),
                  RaisedButton(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    color: ShowSingin ? Colors.blue : Colors.grey[700],
                    onPressed: ShowSingin ?signin: signup,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text( ShowSingin ? 'Login':'register ', style: TextStyle(
                            color: Colors.white, fontSize: 18)),
                        Icon(Icons.arrow_forward_sharp, color: Colors.white)
                      ],),
                  ),

                  Container(margin: EdgeInsets.only(top: 10), child: RichText(
                    text: TextSpan(
                        style: TextStyle(color: Colors.black, fontSize: 16),
                        children: [
                          TextSpan(text: ShowSingin
                              ? 'if you no have Account '
                              : 'if you  have Account'),
                          TextSpan(recognizer: _changesign,
                              text: ShowSingin ? '  Create  Account ' : 'Login',
                              style: TextStyle(color: Colors.blue,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700)),
                        ]),
                  ),
                  ),
                ],),),
              ),


            ],)),


          ]),


    );
  }

  buildPositionedtop(double mdw) {
    return Positioned(
      child: Transform.scale(
        scale: 1.3,
        child: Transform.translate(
          offset: Offset(0, -mdw / 1.7),
          child: Container(
            height: mdw,
            width: mdw,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(mdw),
              color: ShowSingin ? Colors.grey[800] : Colors.blue[800],
            ),
          ),
        ),
      ),);
  }

  buildPositionedBottom(double mdw) {
    return Positioned(
      top: 300,
      right: mdw / 1.5,
      child: Container(
        height: mdw,
        width: mdw,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(mdw),
          color: ShowSingin ? Colors.blue[800].withOpacity(0.5) : Colors
              .grey[800].withOpacity(0.5),
        ),
      ),);
  }

  buildFormBoxLogin(double mdw) {
    return Center(
      child: AnimatedContainer(
        duration: Duration(microseconds: 10000000),

        height: 250,
        width: mdw / 1.2,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.black,
                  spreadRadius: .1,
                  blurRadius: 1,
                  offset: Offset(1, 1))
            ]
        ),

        child: Form(

          //autovalidate: true,
            key: formstatesignin,
            child: Container(
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Start Text Username
                    Text(
                      "Email",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    buildTextFormFieldAll(
                        "Enter  ", false, email, validUserEmail),
                    // End Text username
                    SizedBox(
                      height: 10,
                    ),
                    // Start Text password
                    Text("PassWord",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.w600)),
                    SizedBox(
                      height: 10,
                    ),
                    buildTextFormFieldAll(
                        "enter Password", true, password, validPassWord),
                    // End Text username
                  ],
                ),
              ),
            )),
      ),

    );
  }

  buildFormBoxregister(double mdw) {
    return Center(
      child: Container(

        height: 380,
        width: mdw / 1.2,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.black,
                  spreadRadius: .1,
                  blurRadius: 1,
                  offset: Offset(1, 1))
            ]
        ),

        child: Form(
            key: formstatesignup,
            child: Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Start Text Username
                    Text(
                      " User Name",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    buildTextFormFieldAll(
                        "  Enter user name", false, username,validUserName),
                    // End Text username
                    SizedBox(
                      height: 10,
                    ),
                    // Start Text password
                    Text(" PassWord",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.w600)),
                    SizedBox(
                      height: 10,
                    ),
                    buildTextFormFieldAll(
                        "Enter password", true, password, validPassWord),
                    // Start Text password CONFIRM
                    Text("confirm password ",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.w600)),
                    SizedBox(
                      height: 10,
                    ),
                    buildTextFormFieldAll("confirm password", true,
                        confirmpassword, validConfirmPassWord),
                    // Start Text EMAIL
                    Text("Email",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.w700)),
                    SizedBox(
                      height: 10,
                    ),
                    buildTextFormFieldAll("Enter u Email ", false,
                        email,validUserEmail),
                    // End Text username
                  ],
                ),
              ),
            )),
      ),

    );
  }

  TextFormField buildTextFormFieldAll(String myhinttext, bool pass, TextEditingController myController,myvalid) {
    return TextFormField(
      controller: myController,
      obscureText: pass,
      validator:myvalid,
      autovalidate: true,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(4),
          hintText: myhinttext,
          filled: true,
          fillColor: Colors.grey[200],
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.grey[500], style: BorderStyle.solid, width: 1)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.blue, style: BorderStyle.solid, width: 1))),
    );
  }

}