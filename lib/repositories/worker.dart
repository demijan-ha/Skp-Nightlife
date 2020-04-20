import 'dart:convert';
import 'package:nightlife/models/club.dart';
import 'package:http/http.dart' as http;

class Worker {
  static const String baseUrl = 'http://app.blink.mk/nightlife';
  static const String clubUrl = '/items/clubs';
  static const String fileUrl = '/files/';

  Future<dynamic> getClubs() async {
    final response = await http.get('$baseUrl$clubUrl');

    if (response.statusCode == 200) {
      return ClubList.fromMap(json.decode(response.body));
    } else {
      throw Exception('Failed to load clubs!');
    }
  }

  Future<String> fetchImage(int imageID) async {
    final response = await http.get('$baseUrl$clubUrl$imageID');

    if (response.statusCode == 200) {
      var jsonImage = json.decode(response.body);
      var url = jsonImage['data']['data']['full_url'];
      return url;
    } else {
      throw Exception('Failed to load image!');
    }
  }
}
