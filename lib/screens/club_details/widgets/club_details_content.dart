import 'package:flutter/material.dart';
import 'package:nightlife/const/const.dart';
import 'package:nightlife/models/models.dart';

class ClubDetailsContent extends StatelessWidget {
  final Club club;
  final avatarURL;
  ClubDetailsContent({this.club, this.avatarURL});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 70,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 35),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.WHITE60_TEXT_COLOR,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(50),
              ),
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(avatarURL),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              club.clubName,
              style: eventWhiteTitleTextStyle,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: FittedBox(
              child: Row(
                children: <Widget>[
                  Icon(Icons.location_on, color: AppColors.WHITE),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    club.clubAddress,
                    style: eventLocationTextStyle,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: StarDisplay(
              value: club.rating,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              'Music genres',
              style: eventLocationTextStyle,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: <Widget>[
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: <Widget>[
                    for (var i = 0; i < club.genre.length; i++)
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Chip(
                          label: Text(
                            club.genre[i],
                            style: whiteTextStyle,
                          ),
                          backgroundColor: AppColors.BACKGROUND_TOP_COLOR,
                        ),
                      ),
                  ]),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: Column(
              children: <Widget>[
                Text(
                  club.clubPunchline,
                  style: punchLine1TextStyle,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  club.clubDescription,
                  style: whiteTextStyle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
