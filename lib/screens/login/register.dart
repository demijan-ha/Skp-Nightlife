import 'package:flutter/cupertino.dart';
import 'package:nightlife/screens/login/widgets/diamond.dart';
import 'package:nightlife/const/const.dart';
import 'package:flutter/material.dart';
import 'package:nightlife/screens/login/widgets/register_form.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
            ),
          ),
          child: ListView(
            padding: EdgeInsets.all(0.0),
            children: <Widget>[
              Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      SizedBox(
                        height: 50.0,
                      ),
                      Diamond(image: diamond),
                      SizedBox(
                        height: 150.0,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: RegisterForm(),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      FlatButton(
                        onPressed: () {
                          widget.toggleView();
                        },
                        child: Text(
                          "Have an account? Log in!",
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              letterSpacing: 0.5,
                              color: Colors.white,
                              fontSize: 14.0),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
