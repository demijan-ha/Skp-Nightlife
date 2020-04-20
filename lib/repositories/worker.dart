import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:nightlife/models/club.dart';
import 'package:http/http.dart' as http;

class Worker {
  static const String baseUrl = 'http://app.blink.mk/nightlife';
  static const String clubUrl = '/items/clubs';
  static const String fileUrl = '/files/';

  Future<List<Club>> fetchClubs(http.Client client) async {
    final response = await client.get('$baseUrl$clubUrl');
    print('First response: ${response.body}');
    // Use the compute function to run parsePhotos in a separate isolate.
    return parseClubs(response.body);
  }

// A function that converts a response body into a List<Photo>.
  List<Club> parseClubs(String responseBody) {
    final parsed = jsonDecode(responseBody);
    List<Club> fromMap(Map<String, dynamic> json) =>
        List<Club>.from(json["data"].map((x) => Club.fromJson(x)));

    return fromMap(parsed);
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
