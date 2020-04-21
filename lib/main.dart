import 'package:flutter/material.dart';
import 'package:nightlife/const/const.dart';
import 'package:provider/provider.dart';
import 'package:nightlife/models/models.dart';
import 'package:nightlife/wrapper.dart';
import 'package:nightlife/services/auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        title: 'Skopje Nightlife',
        home: Wrapper(),
      ),
    );
  }
}
