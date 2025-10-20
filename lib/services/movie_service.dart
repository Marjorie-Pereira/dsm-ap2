import 'dart:convert';

import 'package:ap2/constants.dart';
import 'package:ap2/models/movie.dart';
import 'package:http/http.dart' as http;

class MovieService {
  Future<List<Movie>> getMovies() {
      final movies = filmes.map((filme) async {
        final response = await http.get(Uri.parse('${baseApiUrl}t=$filme'));

        if(response.statusCode == 200) {
          var jsonResponse = json.decode(response.body);
          return Movie.fromJson(jsonResponse);
        } else {
          throw Exception("Erro ao buscar filme");
        }
      }).toList();

      return Future.wait(movies);

  }
}