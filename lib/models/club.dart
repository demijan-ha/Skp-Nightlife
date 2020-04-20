import 'package:nightlife/models/models.dart';

class ClubList {
  final List<Club> club;
  ClubImageURL url;

  ClubList({this.club, this.url});
  factory ClubList.fromMap(Map<String, dynamic> json) => ClubList(
        club: List<Club>.from(json["data"].map((x) => Club.fromMap(x))),
      );
}

class Club {
  final int id;
  final String clubName;
  final Location location;
  final String clubExplanation;
  final int imageID;
  final int avatarID;
  final String clubAddress;

  Club({
    this.id,
    this.clubName,
    this.location,
    this.clubExplanation,
    this.imageID,
    this.avatarID,
    this.clubAddress,
    url,
  });

  factory Club.fromMap(Map<String, dynamic> json) {
    return new Club(
      id: json["id"],
      clubName: json["club_name"],
      location: Location.fromMap(json["location"]),
      clubExplanation: json["club_explanation"],
      imageID: json["image"],
      avatarID: json["avatar"],
      clubAddress: json["club_address"],
    );
  }
}

class Location {
  final double lat;
  final double lng;

  Location({
    this.lat,
    this.lng,
  });

  factory Location.fromMap(Map<String, dynamic> json) => Location(
        lat: json["lat"].toDouble(),
        lng: json["lng"].toDouble(),
      );
}

class ClubImageURL {
  String url;
  ClubImageURL({this.url});
}
