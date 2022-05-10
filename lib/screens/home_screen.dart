import 'package:movienight/components/country_item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../data/my_data.dart';
import '../utils/app_routes.dart';

class CountriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Trending Movies'),
        CarouselSlider(
            items: [
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://br.web.img3.acsta.net/pictures/22/02/14/18/29/1382589.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://br.web.img3.acsta.net/pictures/22/02/14/18/29/1382589.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
            options: CarouselOptions(
              height: 350.0,
              enlargeCenterPage: true,
              autoPlay: false,
              aspectRatio: 4 / 5,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: false,
              //autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 0.8,
            )),
        Text('All Movies'),
        Container(
          height: 50,
          width: 250,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: FlatButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(AppRoutes.HOME);
            },
            child: Text(
              'Movie Route',
              style: TextStyle(color: Colors.black, fontSize: 25),
            ),
          ),
        ),
        Expanded(
          child: GridView.count(
            // Create a grid with 2 columns. If you change the scrollDirection to
            // horizontal, this produces 2 rows.
            crossAxisCount: 2,
            // Generate 100 widgets that display their index in the List.
            children: List.generate(6, (index) {
              return Center(
                child: Text(
                  'Item $index',
                  style: Theme.of(context).textTheme.headline5,
                ),
              );
            }),
          ),
        )
      ],
    );
  }
}
