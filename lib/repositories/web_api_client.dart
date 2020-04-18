import 'package:http/http.dart' as http;
import 'package:nightlife/models/models.dart';
import 'dart:convert';

// ignore: missing_return
Future<Clubs> fetchClubs() async {
  final response = await http.get('http://app.blink.mk/nightlife/items/clubs');
  if (response.statusCode == 200) {
    return Clubs.fromJson(json.decode(response.body));
  } else {
    print('Ne mozhe da se zemat podatocite od server.');
  }
}
