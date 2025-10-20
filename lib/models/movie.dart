class Movie {
  final String title;
  final String img;
  final String genre;
  final String year;

  const Movie({required this.title, required this.img, required this.genre, required this.year});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(title: json["Title"], img: json["Poster"], genre: json["Genre"], year: json["Year"]);
  }
}