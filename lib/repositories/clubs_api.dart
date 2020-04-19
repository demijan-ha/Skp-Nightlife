import 'dart:convert';

import 'package:nightlife/models/club.dart';
import 'package:nightlife/repositories/repositories.dart';
import 'package:nightlife/models/models.dart';

const String baseUrl = 'http://app.blink.mk/nightlife';
const String clubUrl = '/items/clubs';
const String fileUrl = '/files/';

class ClubAPI {
  Future<dynamic> getClubs() async {
    Network network = Network('$baseUrl$clubUrl');
    var clubData = await network.getData();
    return clubData;
  }

  Future<ClubImage> fetchImage(int imageID) async {
    Network network = Network('$baseUrl$fileUrl$imageID');
    final clubImageData = await network.getData();

    final clubJson = jsonDecode(clubImageData);
    print(clubJson);
    return ClubImage.fromJson(clubJson);
  }
}
