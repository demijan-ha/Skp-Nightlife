import 'package:flutter/material.dart';
import 'package:nightlife/models/models.dart';

class ListViewForClubs extends StatelessWidget {
  final List<Club> clubs;
  final List<ClubsImages> clubsImages;
  ListViewForClubs({this.clubs, this.clubsImages});

  Image _getImagesURL(imageID) {
    var result = clubsImages.firstWhere(
        (clubsImages) => clubsImages.id == imageID,
        orElse: () => null);
    var url = result.finalURL;

    return Image(
      image: NetworkImage(url),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: clubs.length,
        itemBuilder: (BuildContext context, int index) {
          var i = clubs[index].imageID;
          return Card(
            child: ListTile(
              leading: _getImagesURL(i),
              title:
                  Text('${clubs[index].clubName} and ${clubs[index].imageID}'),
              subtitle: Text(
                '${clubs[index].clubExplanation}',
              ),
            ),
          );
        });
  }
}
