import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nightlife/repositories/repositories.dart';
import 'package:nightlife/widgets/widgets.dart';
import 'package:nightlife/const/const.dart';
import 'package:nightlife/services/auth.dart';
import 'package:nightlife/const/loading.dart';

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
            body: FutureBuilder(
                future: Future.wait([
                  Worker().fetchClubs(http.Client()),
                  Worker().fetchImages(http.Client()),
                ]),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                        child: ListViewForClubs(
                      clubs: snapshot.data[0],
                      clubsImages: snapshot.data[1],
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
