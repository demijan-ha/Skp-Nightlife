import 'package:flutter/material.dart';
import 'package:nightlife/const/const.dart';
import 'package:nightlife/const/loading.dart';
import 'package:nightlife/services/services.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
            backgroundColor: AppColors.PRIMARY_APPBAR_COLOR,
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
                      'Register',
                      style: headerStyleAccent,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'Register for a new accout to have access to all features of the Skopje Nightlife App.',
                      style: TextStyle(
                        color: AppColors.WHITE_TEXT_COLOR,
                        fontSize: 20.0,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                        decoration:
                            textInputDecoration.copyWith(hintText: 'Email'),
                        validator: (val) =>
                            val.isEmpty ? 'Enter an email!' : null,
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
                          val.length < 6 ? 'Enter a strong password!' : null,
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
                            Icons.account_circle,
                            color: Colors.white,
                          ),
                          label: Text(
                            'Sign in',
                            style: textStyleWhite,
                          ),
                        ),
                        RaisedButton.icon(
                            color: AppColors.SECONDARY_COLOR,
                            icon: Icon(Icons.person_add),
                            label: Text(
                              'Register',
                              style: textStyleWhite,
                            ),
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                setState(() => loading = true);
                                dynamic result = await _auth
                                    .registerWithEmailAndPass(email, pass);
                                if (result == null) {
                                  setState(() {
                                    error =
                                        'Could not register with user and pass!';
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
