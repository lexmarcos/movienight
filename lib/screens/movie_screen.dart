import 'package:flutter/material.dart';
import 'package:movienight/models/movie.dart';

class MovieScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (ModalRoute.of(context)!.settings.arguments == Null) {}
    final arguments = ModalRoute.of(context)!.settings.arguments as Movie;

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
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                child: Column(children: [
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        arguments.title,
                        style: TextStyle(
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
                        style: TextStyle(
                            color: Color.fromARGB(150, 255, 255, 255))),
                  ),
                ])),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Sinopse',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(arguments.overview,
                          style: TextStyle(
                              color: Color.fromARGB(200, 255, 255, 255)))),
                ],
              ),
            )
          ],
        )),
        bottomNavigationBar: Container(
          height: 70,
          color: Theme.of(context).colorScheme.primary,
          child: ElevatedButton(
              onPressed: () {},
              child: Text(
                'Já assisti !',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              )),
        ));
  }
}
