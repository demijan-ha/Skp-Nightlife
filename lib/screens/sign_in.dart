import 'package:nightlife/services/auth.dart';
import 'package:nightlife/const/loading.dart';
import 'package:nightlife/const/const.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email = '';
  String pass = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: AppColors.BACKGROUND_COLOR_BLACK,
            body: Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'Skopje Nightlife',
                      style: headerStyleAccent,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                        decoration:
                            textInputDecoration.copyWith(hintText: 'Email'),
                        validator: (val) =>
                            val.isEmpty ? 'Enter a correct email!' : null,
                        onChanged: (val) {
                          setState(() => email = val);
                        }),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration:
                          textInputDecoration.copyWith(hintText: 'Password'),
                      validator: (val) =>
                          val.length < 6 ? 'Enter a correct password!' : null,
                      obscureText: true,
                      onChanged: (val) {
                        setState(() => pass = val);
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    ButtonBar(
                      children: <Widget>[
                        FlatButton.icon(
                          onPressed: () {
                            widget.toggleView();
                          },
                          icon: Icon(
                            Icons.person_add,
                            color: Colors.white,
                          ),
                          label: Text(
                            'Register',
                            style: textStyleWhite,
                          ),
                        ),
                        RaisedButton.icon(
                            color: AppColors.SECONDARY_COLOR,
                            icon: Icon(Icons.account_circle),
                            label: Text(
                              'Sign in',
                              style: textStyleWhite,
                            ),
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                setState(() => loading = true);
                                dynamic result = await _auth
                                    .signInWithEmailAndPass(email, pass);

                                if (result == null) {
                                  setState(() {
                                    error =
                                        'Could not sign in with user and pass!';
                                    loading = false;
                                  });
                                }
                              }
                            }),
                      ],
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    Text(
                      error,
                      style: textStyleAccent,
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
