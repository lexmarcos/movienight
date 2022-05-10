import 'package:flutter/material.dart';

class MovieScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 450,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                  'https://br.web.img3.acsta.net/pictures/22/02/14/18/29/1382589.png'),
            ),
          ),
        ),
        Text('2022 | Adventure, Action | 2h 19m'),
        Text('Sinopse aqui, ok?')
      ],
    ));
  }
}
