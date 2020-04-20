import 'dart:async';
import 'dart:convert';
import 'package:nightlife/models/club.dart';
import 'package:http/http.dart' as http;

class Worker {
  static const String baseUrl = 'http://app.blink.mk/nightlife';
  static const String clubUrl = '/items/clubs';
  static const String fileUrl = '/files';

  // ignore: missing_return
  Future<List<Club>> fetchClubs(http.Client client) async {
    try {
      final responseClubs = await client.get('$baseUrl$clubUrl');
      await fetchImages(client);
      if (responseClubs.statusCode == 200 && responseClubs.body != null) {
        return parseClubs(responseClubs.body);
      } else {
        throw Exception(responseClubs.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  List<Club> parseClubs(String responseBody) {
    final parsedClubs = jsonDecode(responseBody);
    List<Club> fromClubMap(Map<String, dynamic> json) =>
        List<Club>.from(json["data"].map((x) => Club.fromJson(x)));
    return fromClubMap(parsedClubs);
  }

  // ignore: missing_return
  Future<List<ClubsImages>> fetchImages(http.Client client) async {
    try {
      final responseImages = await client.get('$baseUrl$fileUrl');
      if (responseImages.statusCode == 200 && responseImages.body != null) {
        return parseImages(responseImages.body);
      } else {
        throw Exception(responseImages.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  List<ClubsImages> parseImages(String responseImages) {
    final parsedImages = jsonDecode(responseImages);
    List<ClubsImages> fromImageMap(Map<String, dynamic> json) =>
        List<ClubsImages>.from(
            json["data"].map((x) => ClubsImages.fromJson(x)));

    return fromImageMap(parsedImages);
  }
}
