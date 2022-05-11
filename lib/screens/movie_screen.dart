import 'package:flutter/material.dart';
import 'package:movienight/models/movie.dart';
import 'package:provider/provider.dart';

import '../models/UserStore.dart';

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
    addMovieToWatched(){
      final contador = context.read<UserStore>();
          contador.addWatchMovie(arguments);
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(arguments.title),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 450,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(arguments.posterPath),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
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
                            arguments.voteAverage.toString() +
                            ' | ' +
                            arguments.runtime.toString() +
                            ' minutes',
                        style: const TextStyle(
                            color: Color.fromARGB(150, 255, 255, 255))),
                  ),
                ])),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Sinopse',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(arguments.overview,
                          style: const TextStyle(
                              color: Color.fromARGB(200, 255, 255, 255)))),
                ],
              ),
            )
          ],
        )),
        bottomNavigationBar: Container(
          height: 70,
          color: Theme.of(context).colorScheme.primary,
          child: Consumer<UserStore>(
            builder: (context, user, child) {
              print(user.user.watchedMovies.contains(arguments));
              return ElevatedButton(
                onPressed: user.user.watchedMovies.contains(arguments) || isMovieWatched ? null : () {
                  setIsMovieWatched();
                  addMovieToWatched();
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(user.user.watchedMovies.contains(arguments) || isMovieWatched ? Color.fromARGB(255, 120, 22, 22) : const Color.fromARGB(255, 255, 17, 0)),
                  ),
                child: const Text(
                  'ALREADY WATCHED !',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ));
            }
          ),
        ));
  }
}
