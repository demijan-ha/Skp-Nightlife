import 'package:flutter/cupertino.dart';
import 'package:nightlife/screens/login/widgets/diamond.dart';
import 'package:nightlife/const/const.dart';
import 'package:flutter/material.dart';
import 'package:nightlife/screens/login/widgets/register_form.dart';
import 'package:nightlife/screens/login/widgets/sign_in_form.dart';

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
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(0.0, 1.0),
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Diamond(image: diamond),
              SizedBox(
                height: 140.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
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
        ),
      ),
    );
  }
}

//class Register extends StatefulWidget {
//  final Function toggleView;
//  Register({this.toggleView});
//
//  @override
//  _RegisterState createState() => _RegisterState();
//}
//
//class _RegisterState extends State<Register> {
//  final AuthService _auth = AuthService();
//  final _formKey = GlobalKey<FormState>();
//  bool loading = false;
//
//  String email = '';
//  String pass = '';
//  String error = '';
//
//  @override
//  Widget build(BuildContext context) {
//    return loading
//        ? Loading()
//        : Scaffold(
//            backgroundColor: AppColors.PRIMARY_APPBAR_COLOR,
//            body: Container(
//              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
//              child: Form(
//                key: _formKey,
//                child: Column(
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                  children: <Widget>[
//                    SizedBox(
//                      height: 20.0,
//                    ),
//                    Text(
//                      'Register',
//                      style: headerStyleAccent,
//                    ),
//                    SizedBox(
//                      height: 20.0,
//                    ),
//                    Text(
//                      'Register for a new accout to have access to all features of the Skopje Nightlife App.',
//                      style: TextStyle(
//                        color: AppColors.WHITE87_TEXT_COLOR,
//                        fontSize: 20.0,
//                      ),
//                    ),
//                    SizedBox(
//                      height: 20.0,
//                    ),
//                    TextFormField(
//                        validator: (val) =>
//                            val.isEmpty ? 'Enter an email!' : null,
//                        onChanged: (val) {
//                          setState(() => email = val);
//                        }),
//                    SizedBox(
//                      height: 20.0,
//                    ),
//                    TextFormField(
//                      validator: (val) =>
//                          val.length < 6 ? 'Enter a strong password!' : null,
//                      obscureText: true,
//                      onChanged: (val) {
//                        setState(() => pass = val);
//                      },
//                    ),
//                    SizedBox(
//                      height: 20.0,
//                    ),
//                    ButtonBar(
//                      children: <Widget>[
//                        FlatButton.icon(
//                          onPressed: () {
//                            widget.toggleView();
//                          },
//                          icon: Icon(
//                            Icons.account_circle,
//                            color: Colors.white,
//                          ),
//                          label: Text(
//                            'Sign in',
//                            style: whiteTextStyle,
//                          ),
//                        ),
//                        RaisedButton.icon(
//                            color: AppColors.SECONDARY_ACCENT_COLOR,
//                            icon: Icon(Icons.person_add),
//                            label: Text(
//                              'Register',
//                              style: whiteTextStyle,
//                            ),
//                            onPressed: () async {
//                              if (_formKey.currentState.validate()) {
//                                setState(() => loading = true);
//                                dynamic result = await _auth
//                                    .registerWithEmailAndPass(email, pass);
//                                if (result == null) {
//                                  setState(() {
//                                    error =
//                                        'Could not register with user and pass!';
//                                    loading = false;
//                                  });
//                                }
//                              }
//                            }),
//                      ],
//                    ),
//                    SizedBox(
//                      height: 12.0,
//                    ),
//                    Text(
//                      error,
//                      style: textStyleAccent,
//                    )
//                  ],
//                ),
//              ),
//            ),
//          );
//  }
//}
