import 'package:movienight/components/card_movie.dart';
import 'package:movienight/components/country_item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movienight/components/movie_cover.dart';
import '../data/my_data.dart';
import '../utils/app_routes.dart';

// TESTING - HENRY
class CountriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Align(
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
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 45, vertical: 15),
                child: Text(
                  'All Movies',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                )),
          ),
          Column(
            children: MOVIES.map((movie) {
              return CardMovie(movie);
            }).toList(),
          )
        ],
      ),
    );
  }
}
