import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:nightlife/const/colors.dart';
import 'package:nightlife/const/const.dart';
import 'package:nightlife/models/models.dart';
import 'package:nightlife/screens/club_details/club_details_page.dart';

class ListViewForClubs extends StatelessWidget {
  final List<Club> clubs;
  final List<ClubsImages> clubsImages;
  ListViewForClubs({this.clubs, this.clubsImages});

  String _getImageURL(imageID) {
    var url;
    var result = clubsImages.firstWhere(
      (clubsImages) => clubsImages.id == imageID,
    );
    if (result != null) {
      url = result.finalURL;
      return url;
    } else {
      url = '/assets/img/placeholder.jpg';
      return url;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: clubs.length,
        itemBuilder: (BuildContext context, int index) {
          final club = clubs[index];
          final i = club.imageID;
          final imageURL = _getImageURL(i);
          final a = club.avatarID;
          final avatarURL = _getImageURL(a);

          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ClubDetailsPage(
                        club: club,
                        imageURL: imageURL,
                        avatarURL: avatarURL,
                      )));
            },
            child: Card(
              margin: EdgeInsets.symmetric(vertical: 10),
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              color: AppColors.BACKGROUND_TOP_COLOR,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ),
                      child: Image(
                        image: NetworkImage(imageURL),
                        height: 150,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.WHITE60_TEXT_COLOR,
                                  width: 1.5,
                                ),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: CircleAvatar(
                                radius: 40,
                                backgroundImage: NetworkImage(avatarURL),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  '${club.clubName}',
                                  style: eventTitleTextStyle,
                                ),
                                Text(
                                  '${club.clubAddress}',
                                  style: eventLocationTextStyle,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
