import 'package:flutter/cupertino.dart';
import 'package:nightlife/screens/login/widgets/diamond.dart';
import 'package:nightlife/const/const.dart';
import 'package:flutter/material.dart';
import 'package:nightlife/screens/login/widgets/sign_in_form.dart';

class SignInPage extends StatefulWidget {
  final Function toggleView;
  SignInPage({this.toggleView});

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: backgroundImage,
        ),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: <Color>[
              Color.fromRGBO(195, 20, 50, 0.6),
              Color.fromRGBO(36, 11, 54, 0.7),
            ],
            stops: [0.2, 1.0],
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(0.0, 1.0),
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Diamond(image: diamond),
              SizedBox(
                height: 140.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                child: LoginForm(),
              ),
              SizedBox(
                height: 40.0,
              ),
              FlatButton(
                onPressed: () {
                  widget.toggleView();
                },
                child: Text(
                  "Don't have an account? Sign Up",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      letterSpacing: 0.5,
                      color: Colors.white,
                      fontSize: 12.0),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
