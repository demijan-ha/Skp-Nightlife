import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nightlife/models/models.dart';
import 'package:nightlife/screens/authenticate.dart';
import 'package:nightlife/screens/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}