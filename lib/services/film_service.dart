import 'dart:convert';
// import 'dart:developer';
import 'package:flutter_tp/models/film.dart';
import 'package:http/http.dart' as http;

class FilmService {
  Future getFilm() async {
    Uri url = Uri.parse(
        "https://api.reelgood.com/v3.0/content/random?sources=netflix");
    http.Response response = await http.get(url);
    Map data = jsonDecode(response.body);
    // inspect(data);
    return Film.fromJson(data);
  }
}
