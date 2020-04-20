import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nightlife/models/models.dart';
import 'package:nightlife/repositories/repositories.dart';
import 'package:nightlife/const/const.dart';
import 'package:nightlife/services/auth.dart';
import 'package:nightlife/const/loading.dart';
import 'package:http/http.dart' as http;

class FutureBuilderOfList extends StatefulWidget {
  @override
  _FutureBuilderOfListState createState() => _FutureBuilderOfListState();
}

class _FutureBuilderOfListState extends State<FutureBuilderOfList> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    bool loading = false;

    return loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.PRIMARY_APPBAR_COLOR,
              title: Text(
                appTitle,
                style: textStyleWhite,
              ),
              actions: <Widget>[
                FlatButton.icon(
                  onPressed: () {
                    AuthService().signOut();
                  },
                  icon: Icon(
                    Icons.exit_to_app,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Sign out',
                    style: textStyleWhite,
                  ),
                ),
              ],
            ),
            body: FutureBuilder<List<Club>>(
                future: Worker().fetchClubs(http.Client()),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                        child: ListViewForClubs(
                      clubs: snapshot.data,
                    ));
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return Center(
                    child: Container(
                      child: SpinKitWave(
                        color: AppColors.PRIMARY_COLOR,
                        size: 50.0,
                      ),
                    ),
                  );
                }));
  }
}

class ListViewForClubs extends StatelessWidget {
  final List<Club> clubs;
  ListViewForClubs({this.clubs});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: clubs.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              title: Text('${clubs[index].clubName}'),
              subtitle: Text(
                '${clubs[index].clubExplanation}',
              ),
            ),
          );
        });
  }
}
