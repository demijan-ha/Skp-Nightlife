import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nightlife/models/models.dart';
import 'package:nightlife/repositories/repositories.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Isolate Demo';

    return MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<Clubs> futureClub;
  @override
  void initState() {
    super.initState();
    futureClub = fetchClubs();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: FutureBuilder<Clubs>(
          future: futureClub,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final _clubData = snapshot.data.data;
              return ListView.builder(
                itemCount: _clubData.length,
                itemBuilder: (BuildContext context, int index) {
                  Club club = _clubData[index];
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          club.id.toString(),
                          style: TextStyle(fontSize: 26.0),
                        ),
                        Text(club.clubName),
                        Text(club.clubExplanation),
                        Text(club.clubAddress),
                        Text(
                            '${club.location.lat.toString()} , ${club.location.lng.toString()}'),
                        Text(club.image.toString()),
                        Text(club.avatar.toString()),
                      ],
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            // By default, show a loading spinner.
            return CircularProgressIndicator();
          },
        ));
  }
}
