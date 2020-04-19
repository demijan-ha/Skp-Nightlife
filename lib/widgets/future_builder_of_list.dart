import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nightlife/models/models.dart';
import 'package:nightlife/repositories/repositories.dart';
import 'package:nightlife/const/const.dart';

class FutureBuilderOfList extends StatefulWidget {
  @override
  _FutureBuilderOfListState createState() => _FutureBuilderOfListState();
}

class _FutureBuilderOfListState extends State<FutureBuilderOfList> {
  ClubList clubList = ClubList();

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    _fetchListItems() async {
      var result = await ClubAPI().getClubs();
      var clubMap = json.decode(result);
      clubList = ClubList.fromJson(clubMap);

      return clubList;
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: FutureBuilder(
            future: _fetchListItems(),
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              } else {
                return Container(
                    child: ListView.builder(
                        itemCount: clubList.clubs.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Text('${clubList.clubs[index].clubName}');
                        }));
              }
            }));
  }
}
