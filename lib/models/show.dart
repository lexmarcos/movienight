import 'package:flutter/material.dart';
import 'package:movienight/models/genre.dart';

class Show {
  final String id;
  final String title;
  final List<Genre> genreIds;
  final int popularity;
  final String posterPath;
  final String overview;
  final String status;
  final String tagline;
  final int voteAverage;

  const Show({
    required this.id,
    required this.title,
    required this.genreIds,
    required this.popularity,
    required this.posterPath,
    required this.overview,
    required this.status,
    required this.tagline,
    required this.voteAverage,
  });
}
