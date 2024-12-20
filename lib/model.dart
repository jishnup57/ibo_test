// To parse this JSON data, do
//
//     final movies = moviesFromMap(jsonString);

import 'dart:convert';

List<Movies> moviesFromMap(String str) => List<Movies>.from(json.decode(str).map((x) => Movies.fromMap(x)));

String moviesToMap(List<Movies> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Movies {
  String title;
  String type;
  String titlereleased;
  String imageLandscape;
  String imagePortrait;
  String rating;
  String? quality;
  String actors;
  String director;
  String category;
  String? imdb;
  String runtime;
  String netflixid;
  DateTime dateReleased;
  String description;
  String language;

  Movies({
    required this.title,
    required this.type,
    required this.titlereleased,
    required this.imageLandscape,
    required this.imagePortrait,
    required this.rating,
    required this.quality,
    required this.actors,
    required this.director,
    required this.category,
    required this.imdb,
    required this.runtime,
    required this.netflixid,
    required this.dateReleased,
    required this.description,
    required this.language,
  });

  Movies copyWith({
    String? title,
    String? type,
    String? titlereleased,
    String? imageLandscape,
    String? imagePortrait,
    String? rating,
    String? quality,
    String? actors,
    String? director,
    String? category,
    String? imdb,
    String? runtime,
    String? netflixid,
    DateTime? dateReleased,
    String? description,
    String? language,
  }) =>
      Movies(
        title: title ?? this.title,
        type: type ?? this.type,
        titlereleased: titlereleased ?? this.titlereleased,
        imageLandscape: imageLandscape ?? this.imageLandscape,
        imagePortrait: imagePortrait ?? this.imagePortrait,
        rating: rating ?? this.rating,
        quality: quality ?? this.quality,
        actors: actors ?? this.actors,
        director: director ?? this.director,
        category: category ?? this.category,
        imdb: imdb ?? this.imdb,
        runtime: runtime ?? this.runtime,
        netflixid: netflixid ?? this.netflixid,
        dateReleased: dateReleased ?? this.dateReleased,
        description: description ?? this.description,
        language: language ?? this.language,
      );

  factory Movies.fromMap(Map<String, dynamic> json) => Movies(
    title: json["title"],
    type: json["type"],
    titlereleased: json["titlereleased"],
    imageLandscape: json["image_landscape"],
    imagePortrait: json["image_portrait"],
    rating: json["rating"],
    quality: json["quality"],
    actors: json["actors"],
    director: json["director"],
    category: json["category"],
    imdb: json["imdb"],
    runtime: json["runtime"],
    netflixid: json["netflixid"],
    dateReleased: DateTime.parse(json["date_released"]),
    description: json["description"],
    language: json["language"],
  );

  Map<String, dynamic> toMap() => {
    "title": title,
    "type": type,
    "titlereleased": titlereleased,
    "image_landscape": imageLandscape,
    "image_portrait": imagePortrait,
    "rating": rating,
    "quality": quality,
    "actors": actors,
    "director": director,
    "category": category,
    "imdb": imdb,
    "runtime": runtime,
    "netflixid": netflixid,
    "date_released": "${dateReleased.year.toString().padLeft(4, '0')}-${dateReleased.month.toString().padLeft(2, '0')}-${dateReleased.day.toString().padLeft(2, '0')}",
    "description": description,
    "language": language,
  };
}
