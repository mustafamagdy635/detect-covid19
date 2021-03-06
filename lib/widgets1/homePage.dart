import 'package:detect/widgets1/LoginPage.dart';
import 'package:detect/widgets1/registerPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';




class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _submitButton() {
    return InkWell(
      onTap: () {
     Navigator.push(context, MaterialPageRoute(
         builder: (context) => LoginPage()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: Text(
          'Log In',
          style: TextStyle(fontSize: 20, color: Colors.white,fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _signUpButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => RegisterPage()));
      },
      child: Container(

        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: Text(
          'Register ',
          style: TextStyle(fontSize: 20, color: Colors.white,fontWeight: FontWeight.bold),
        ),
      ),
    );

  }

  Widget _label() {
    return Container(margin: EdgeInsets.only(top: 40, bottom: 20), child: null);
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'C',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 40,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          children: [
            WidgetSpan(
              child: Icon(
                Icons.coronavirus_sharp,
                size: 40,
                color: Colors.green[600],
              ),
            ),
            TextSpan(
              text: 'vid',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
              ),
            ),
            TextSpan(
              text: ' Sp',
              style: TextStyle(color: Colors.white, fontSize: 40),
            ),
            WidgetSpan(
              child: Icon(
                Icons.coronavirus_sharp,
                size: 40,
                color: Colors.green[600],
              ),
            ),
            TextSpan(
              text: ' t',
              style: TextStyle(color: Colors.white, fontSize: 40),
            ),
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2),
            ],
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.deepPurple[50], Colors.deepPurple[900]]),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                'assets/images/covid19.jpg',
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _title(),
              SizedBox(
                height: 80,
              ),
              _submitButton(),
              SizedBox(
                height: 20,
              ),
              _signUpButton(),
              SizedBox(
                height: 20,
              ),
              _label()
            ],
          ),
        ),
      ),
    );
  }
}
