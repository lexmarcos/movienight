import 'package:movienight/screens/countries_places_screen.dart';
import 'package:movienight/utils/app_routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../models/movie.dart';

class CardMovie extends StatelessWidget {
  final Movie movie;

  const CardMovie(this.movie);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () =>
            Navigator.of(context).pushNamed(AppRoutes.MOVIE, arguments: movie),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          child: Container(
              height: 120,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Container(
                    width: 80,
                    height: 120,
                    margin: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: NetworkImage(movie.posterPath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                                movie.title.length > 15
                                    ? movie.title.replaceRange(
                                        15, movie.title.length, '...')
                                    : movie.title,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.left,
                              ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                              movie.realeaseDate +
                                  ' | ' +
                                  movie.voteAverage.toString() +
                                  ' | ' +
                                  movie.runtime.toString() +
                                  ' m',
                              textAlign: TextAlign.left,
                              style: const TextStyle(fontSize: 14),
                            ),
                        )
                      ],
                    ),
                  )
                ],
              )),
        ));
  }
}
