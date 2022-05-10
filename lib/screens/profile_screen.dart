import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 100,
          backgroundColor: Colors.red,
        ),
        Text('Username'),
        Text('Hours Watched: {}'),
        Text('Favorite Genre: {}'),
        Text('Favorite Movies'),
        Expanded(
            child: ListView(scrollDirection: Axis.horizontal, children: [
          MovieItem(),
          SizedBox(
            width: 12,
          ),
          MovieItem(),
          SizedBox(
            width: 12,
          ),
          MovieItem(),
          SizedBox(
            width: 12,
          ),
          MovieItem(),
          SizedBox(
            width: 12,
          )
        ]))
      ],
    );
  }
}

class MovieItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 300,
      color: Colors.blue,
    );
  }
}
