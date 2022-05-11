import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 32),
            Center(
              child: SizedBox(
                  height: 115,
                  width: 115,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://static.generated.photos/vue-static/face-generator/landing/wall/20.jpg'),
                  )),
            ),
            SizedBox(height: 8),
            Center(
              child: Text('Tonguinha da Silva', // VIA PROVIDER?
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
            ),
            SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Column(children: [
                Text('55h',
                    style:
                        TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                SizedBox(height: 3.0),
                Text('Watched Hours',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.normal))
              ]),
              Column(children: [
                Text('10',
                    style:
                        TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                SizedBox(height: 3.0),
                Text('Watched Movies',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.normal))
              ]),
            ]),
            Padding(
                padding: EdgeInsets.only(left: 45, top: 40, bottom: 24),
                child: Text(
                  'Your watched movies',
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                )),
            Padding(
              padding: EdgeInsets.only(left: 45),
              child: Container(
                  height: 200,
                  child: Container(
                    child:
                        ListView(scrollDirection: Axis.horizontal, children: [
                      AspectRatio(
                          // COMPONENTIZAR
                          aspectRatio: 4 / 5,
                          child: Container(
                              margin: EdgeInsets.only(right: 15),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          'https://image.tmdb.org/t/p/original/tuzKA9K5Ae9IzaA0R9oAgbyhAI3.jpg'),
                                      fit: BoxFit.cover)))),
                      AspectRatio(
                          // COMPONENTIZAR
                          aspectRatio: 4 / 5,
                          child: Container(
                              margin: EdgeInsets.only(right: 15),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          'https://image.tmdb.org/t/p/original/tuzKA9K5Ae9IzaA0R9oAgbyhAI3.jpg'),
                                      fit: BoxFit.cover)))),
                      AspectRatio(
                          aspectRatio: 4 / 5,
                          child: Container(
                              margin: EdgeInsets.only(right: 15),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          'https://image.tmdb.org/t/p/original/tuzKA9K5Ae9IzaA0R9oAgbyhAI3.jpg'),
                                      fit: BoxFit.cover)))),
                    ]),
                  )),
            )
          ],
        ));
  }
}
