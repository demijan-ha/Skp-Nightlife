import 'dart:convert';

Clubs clubsFromJson(String str) => Clubs.fromJson(json.decode(str));

class Clubs {
  final List<Club> data;

  Clubs({
    this.data,
  });

  factory Clubs.fromJson(Map<String, dynamic> json) => Clubs(
        data: List<Club>.from(json["data"].map((x) => Club.fromJson(x))),
      );
}

class Club {
  final int id;
  final String status;
  final String clubName;
  final Location location;
  final String clubExplanation;
  final int image;
  final int avatar;
  final String clubAddress;

  Club({
    this.id,
    this.status,
    this.clubName,
    this.location,
    this.clubExplanation,
    this.image,
    this.avatar,
    this.clubAddress,
  });

  factory Club.fromJson(Map<String, dynamic> json) => Club(
        id: json["id"],
        status: json["status"],
        clubName: json["club_name"],
        location: Location.fromJson(json["location"]),
        clubExplanation: json["club_explanation"],
        image: json["image"],
        avatar: json["avatar"],
        clubAddress: json["club_address"],
      );
}

class Location {
  final double lat;
  final double lng;

  Location({
    this.lat,
    this.lng,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        lat: json["lat"].toDouble(),
        lng: json["lng"].toDouble(),
      );
}
