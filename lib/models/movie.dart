import 'package:flutter/material.dart';
import 'package:movienight/models/genre.dart';
import 'package:movienight/models/show.dart';

class Movie extends Show {
  final String realeaseDate;
  final int runtime;

  Movie(
      {required int id,
      required String title,
      required double popularity,
      required String posterPath,
      required String overview,
      required String status,
      required String tagline,
      required double voteAverage,
      required this.realeaseDate,
      required this.runtime})
      : super(
          id: id,
          title: title,
          popularity: popularity,
          posterPath: posterPath,
          overview: overview,
          status: status,
          tagline: tagline,
          voteAverage: voteAverage,
        );
}
