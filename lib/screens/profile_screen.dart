import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/aspect_ratio_movie_card.dart';
import '../models/UserStore.dart';
import '../utils/app_routes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<UserStore>(
          builder: (context, user, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 32),
                const Center(
                  child: SizedBox(
                      height: 115,
                      width: 115,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://static.generated.photos/vue-static/face-generator/landing/wall/20.jpg'),
                      )),
                ),
                const SizedBox(height: 8),
                Center(
                  child: Text(user.user.username, // VIA PROVIDER?
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.w500)),
                ),
                const SizedBox(height: 20),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(children: [
                        Text(getTimeString(user.user.totalTimeWatched),
                            style: const TextStyle(
                                fontSize: 32, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 3.0),
                        const Text('Watched hours',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.normal))
                      ]),
                      Column(children: [
                        Text(user.user.watchedMovies.length.toString(),
                            style: const TextStyle(
                                fontSize: 32, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 3.0),
                        const Text('Watched Movies',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.normal))
                      ]),
                    ]),
                const Padding(
                    padding: EdgeInsets.only(left: 45, top: 40, bottom: 24),
                    child: Text(
                      'Your watched movies',
                      textAlign: TextAlign.right,
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 45),
                  child: SizedBox(
                      height: 200,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: user.user.watchedMovies.map((movie) {
                          return AspectRatioMovieCard(movie);
                        }).toList(),
                      )),
                )
              ],
            );
          },
        ));
  }
}
