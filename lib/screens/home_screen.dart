import 'package:movienight/components/card_movie.dart';
import 'package:movienight/components/country_item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movienight/components/movie_cover.dart';
import 'package:provider/provider.dart';
import '../data/my_data.dart';
import '../models/UserStore.dart';
import '../utils/app_routes.dart';

// TESTING - HENRY
class CountriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Consumer<UserStore>(
            builder: (context, user, child) {
                return Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 15),
                  child: Text(
                    'Hi ${user.user.username}!',
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
            );
              },
          ),
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
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 5),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                aspectRatio: 4 / 5,

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
