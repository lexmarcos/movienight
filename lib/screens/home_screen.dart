import 'package:movienight/components/country_item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movienight/components/movie_cover.dart';
import '../data/my_data.dart';
import '../utils/app_routes.dart';

class CountriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 45, vertical: 15),
              child: Text(
                'Trending Movies',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              )),
        ),
        CarouselSlider(
            items: MOVIES.map((movie) {
              return MovieCover(movie);
            }).toList(),
            options: CarouselOptions(
              height: 420.0,
              enlargeCenterPage: true,
              autoPlay: false,
              aspectRatio: 4 / 5,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: false,
              //autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 0.8,
            )),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 45, vertical: 15),
              child: Text(
                'All Movies',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              )),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          child: Container(
            height: 120,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(10)),
            child: Container(
              width: 60,
              height: 120,
              margin: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: NetworkImage(
                      'https://image.tmdb.org/t/p/original/tuzKA9K5Ae9IzaA0R9oAgbyhAI3.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
