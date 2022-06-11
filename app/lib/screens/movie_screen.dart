import 'package:flutter/material.dart';
import 'package:movienight/models/movie.dart';
import 'package:provider/provider.dart';

import '../models/UserStore.dart';
import '../utils/app_routes.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  bool isMovieWatched = false;

  setIsMovieWatched() {
    setState(() {
      isMovieWatched = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (ModalRoute.of(context)!.settings.arguments == Null) {}
    final arguments = ModalRoute.of(context)!.settings.arguments as Movie;
    addMovieToWatched() {
      final contador = context.read<UserStore>();
      contador.addWatchMovie(arguments);
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(
            arguments.title.length > 20
                ? arguments.title
                    .replaceRange(20, arguments.title.length, '...')
                : arguments.title,
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 570,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(arguments.posterPath),
                ),
              ),
            ),
            Container(
                height: 75,
                width: 75,
                transform: Matrix4.translationValues(0.0, -40.0, 0.0),
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 255, 0, 0),
                ),
                child: Stack(alignment: Alignment.center, children: [
                  Text(arguments.voteAverage.toString(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(
                        strokeWidth: 6,
                        value: (arguments.voteAverage / 10),
                        color: Colors.white),
                  ),
                ])),
            Container(
              transform: Matrix4.translationValues(0.0, -50.0, 0.0),
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 40),
                      child: Column(children: [
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Text(
                              arguments.title,
                              style: const TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                              arguments.realeaseDate +
                                  ' | ' +
                                  arguments.status +
                                  ' | ' +
                                  getTimeString(arguments.runtime) +
                                  ' hours',
                              style: const TextStyle(
                                  color: Color.fromARGB(150, 255, 255, 255))),
                        ),
                      ])),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 10),
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Text('Sinopse',
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold)),
                          ),
                        ),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(arguments.overview,
                                style: const TextStyle(
                                    color:
                                        Color.fromARGB(126, 255, 255, 255)))),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        )),
        bottomNavigationBar: Container(
          height: 70,
          color: Theme.of(context).colorScheme.primary,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: double.infinity,
                  child: Consumer<UserStore>(builder: (context, user, child) {
                    print(user.user.watchedMovies.contains(arguments));
                    return ElevatedButton(
                        onPressed:
                            user.user.watchedMovies.contains(arguments) ||
                                    isMovieWatched
                                ? null
                                : () {
                                    setIsMovieWatched();
                                    addMovieToWatched();
                                  },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              user.user.watchedMovies.contains(arguments) ||
                                      isMovieWatched
                                  ? Theme.of(context).colorScheme.primary
                                  : const Color.fromARGB(255, 255, 17, 0)),
                        ),
                        child: Text(
                          user.user.watchedMovies.contains(arguments) ||
                                  isMovieWatched
                              ? 'Movie is already in your list.'
                              : 'ALREADY WATCHED !',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ));
                  }),
                ),
              ),
              Expanded(
                  child: Container(
                height: double.infinity,
                child: ElevatedButton(
                    onPressed: () =>
                        Navigator.of(context).pushNamed(AppRoutes.PRODUCTS),
                    child: Text('Comprar produtos')),
              ))
            ],
          ),
        ));
  }
}
