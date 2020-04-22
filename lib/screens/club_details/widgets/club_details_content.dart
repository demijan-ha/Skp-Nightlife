import 'package:flutter/material.dart';
import 'package:nightlife/const/const.dart';
import 'package:nightlife/models/models.dart';

class ClubDetailsContent extends StatelessWidget {
  final Club club;
  final avatarURL;
  ClubDetailsContent({this.club, this.avatarURL});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 70,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
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
            height: 10,
          ),
          Text(
            club.clubName,
            style: eventWhiteTitleTextStyle,
          ),
          SizedBox(
            height: 10,
          ),
          FittedBox(
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
          SizedBox(
            height: 10,
          ),
          StarDisplay(
            value: club.rating,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: Column(
              children: <Widget>[
                Text(
                  club.clubPunchline,
                  style: punchLine1TextStyle,
                ),
                SizedBox(
                  height: 10,
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
