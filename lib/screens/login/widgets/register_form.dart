import 'package:flutter/material.dart';
import 'package:nightlife/const/const.dart';
import 'package:nightlife/services/auth.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final AuthService _auth = AuthService();
  String email = '';
  String pass = '';
  String error = '';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'Register for a new account',
            style: TextStyle(
              color: AppColors.WHITE100_TEXT_COLOR,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            validator: (val) => val.isEmpty ? 'Enter a correct email!' : null,
            onChanged: (val) {
              setState(() => email = val);
            },
            style: TextStyle(
              color: AppColors.WHITE100_TEXT_COLOR,
            ),
            decoration: inputDecoration.copyWith(
                labelText: 'Email',
                icon: Icon(
                  Icons.person_outline,
                  color: AppColors.WHITE60_TEXT_COLOR,
                )),
          ),
          SizedBox(
            height: 10.0,
          ),
          TextFormField(
            obscureText: true,
            style: TextStyle(
              color: AppColors.WHITE100_TEXT_COLOR,
            ),
            decoration: inputDecoration.copyWith(
                labelText: 'Password',
                icon: Icon(
                  Icons.lock_outline,
                  color: AppColors.WHITE60_TEXT_COLOR,
                )),
            validator: (val) =>
                val.length < 6 ? 'Enter a correct password!' : null,
            onChanged: (val) {
              setState(() => pass = val);
            },
          ),
          SizedBox(
            height: 30.0,
          ),
          OutlineButton(
              padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 12.0),
              shape: StadiumBorder(),
              borderSide: BorderSide(color: AppColors.WHITE),
              child: Text(
                'Sign up for account',
                style: whiteTextStyle.copyWith(fontSize: 16.0),
              ),
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  dynamic result =
                      await _auth.signInWithEmailAndPass(email, pass);

                  if (result == null) {
                    setState(() {
                      error = 'Could not create account with user and pass!';
                    });
                  }
                }
              }),
        ],
      ),
    );
  }
}
