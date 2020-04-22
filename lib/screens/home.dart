import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nightlife/widgets/widgets.dart';
import 'package:nightlife/models/models.dart';
import 'package:nightlife/services/auth.dart';
import 'package:nightlife/services/db.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Club>>.value(
      // TODO: Change this to the DB Service that gets all Clubs
//      value: DatabaseService(),
      child: FutureBuilderOfList(), value: null,
    );
  }
}
