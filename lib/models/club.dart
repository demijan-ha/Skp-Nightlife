class ClubList {
  List<Club> clubs;

  ClubList({this.clubs});

  factory ClubList.fromJson(Map<String, dynamic> json) => ClubList(
        clubs: List<Club>.from(json["data"].map((x) => Club.fromJson(x))),
      );
}

class Club {
  int id;
  String clubName;
  String clubExplanation;
  String clubAddress;
  int imageID;
  int avatarID;
  ClubImage clubImage;
  Location location;

  Club({
    this.id,
    this.clubName,
    this.clubExplanation,
    this.clubAddress,
    this.location,
    this.imageID,
    this.avatarID,
    this.clubImage,
  });

  factory Club.fromJson(Map<String, dynamic> json) {
    final imageID = json["image"];

    return Club(
      id: json["id"],
      clubName: json["club_name"],
      location: Location.fromJson(json["location"]),
      clubExplanation: json["club_explanation"],
      imageID: json["image"],
      avatarID: json["avatar"],
      clubAddress: json["club_address"],
    );
  }
}

////////////////////////////////////////////////////////////////////////////////
class ClubImage {
  String url;
  ClubImage({this.url});

  static ClubImage fromJson(dynamic json) {
    final data = json['data']['data'];
    print(data);
    return ClubImage(
      url: data['full_url'] as String,
    );
  }
}

class ClubAvatar {
  String avatarUrl;

  ClubAvatar({this.avatarUrl});
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
