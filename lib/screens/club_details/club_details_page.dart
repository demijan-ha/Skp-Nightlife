import 'package:flutter/material.dart';
import 'package:nightlife/const/colors.dart';
import 'package:nightlife/models/models.dart';
import 'package:nightlife/screens/club_details/widgets/club_details_background.dart';
import 'package:nightlife/screens/club_details/widgets/club_details_content.dart';

class ClubDetailsPage extends StatelessWidget {
  final Club club;
  final imageURL;
  final avatarURL;
  ClubDetailsPage({this.club, this.imageURL, this.avatarURL});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BACKGROUND_COLOR,
      body: Stack(
        children: <Widget>[
          ClubPageBackground(imageURL: imageURL),
          ClubDetailsContent(club: club, avatarURL: avatarURL),
        ],
      ),
    );
  }
}
