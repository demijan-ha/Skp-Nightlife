import 'package:flutter/material.dart';
import 'package:nightlife/models/models.dart';
import 'package:nightlife/repositories/repositories.dart';
import 'package:nightlife/const/const.dart';

class FutureBuilderOfList extends StatefulWidget {
  @override
  _FutureBuilderOfListState createState() => _FutureBuilderOfListState();
}

class _FutureBuilderOfListState extends State<FutureBuilderOfList> {
  Future<Clubs> futureClub;

  @override
  void initState() {
    super.initState();
    futureClub = fetchClubs();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
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
    ;
  }
}
