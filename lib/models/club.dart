class Club {
  int id;
  String clubName;
  Location location;
  int imageID;
  int avatarID;
  String clubAddress;
  String clubDescription;
  String clubPunchline;
  List<String> genre;
  int rating;
  List<String> workingDays;
  String openHours;
  String closeHours;
  int telephone;
  final String imageURL;
  final String avatarURL;

  Club({
    this.id,
    this.clubName,
    this.location,
    this.imageID,
    this.avatarID,
    this.clubAddress,
    this.clubDescription,
    this.clubPunchline,
    this.genre,
    this.rating,
    this.workingDays,
    this.openHours,
    this.closeHours,
    this.telephone,
    this.imageURL,
    this.avatarURL,
  });

  // ignore: non_constant_identifier_names
  factory Club.fromJson(Map<String, dynamic> json,
      [String imageURL, String avatarURL]) {
    return new Club(
      id: json["id"],
      clubName: json["club_name"],
      location: Location.fromJson(json["location"]),
      imageID: json["image"],
      avatarID: json["avatar"],
      clubAddress: json["club_address"],
      clubDescription: json["club_description"],
      clubPunchline: json["club_punchline"],
      genre: List<String>.from(json["genre"].map((x) => x)),
      rating: json["rating"],
      workingDays: List<String>.from(json["working_days"].map((x) => x)),
      openHours: json["open_hours"],
      closeHours: json["close_hours"],
      telephone: json["telephone"],
      imageURL: imageURL,
      avatarURL: avatarURL,
    );
  }

  Club addImagesURL(String imageURL, String avatarURL) {
    return Club(
      imageURL: imageURL,
      avatarURL: avatarURL,
    );
  }
}

class ClubsImages {
  int id;
  String finalURL;

  ClubsImages({this.id, this.finalURL});

  factory ClubsImages.fromJson(Map<String, dynamic> json) {
    return ClubsImages(
      id: json['id'],
      finalURL: json['data']['full_url'],
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

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        lat: json["lat"].toDouble(),
        lng: json["lng"].toDouble(),
      );
}
