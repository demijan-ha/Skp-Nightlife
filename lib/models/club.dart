class Club {
  final int id;
  final String clubName;
  final Location location;
  final String clubExplanation;
  final String clubAddress;
  final int imageID;
  final int avatarID;
  final String imageURL;
  final String avatarURL;

  Club({
    this.id,
    this.clubName,
    this.location,
    this.clubExplanation,
    this.clubAddress,
    this.imageID,
    this.avatarID,
    this.imageURL,
    this.avatarURL,
  });

  factory Club.fromJson(Map<String, dynamic> json) {
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

  Club addImagesURL(String imageURL, String avatarURL) {
    return Club(
      imageURL: imageURL,
      avatarURL: avatarURL,
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
