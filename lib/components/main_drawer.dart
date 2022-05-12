import 'package:movienight/utils/app_routes.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  final _name = 'Tonguinha da Silva';
  final _urlImage =
      'https://static.generated.photos/vue-static/face-generator/landing/wall/20.jpg';

  Widget buildMenuItem(
      {required String text,
      required IconData icon,
      required Function() onTap}) {
    final color = Colors.white;
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(
        text,
        style: TextStyle(color: color),
      ),
      onTap: onTap,
    );
  }

  Widget buildDrawerHeader({required name, required urlImage}) {
    return InkWell(
        child: Container(
      child: Row(children: [
        CircleAvatar(radius: 30, backgroundImage: NetworkImage(urlImage)),
        SizedBox(
          width: 24,
        ),
        Text(name)
      ]),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Material(
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        children: [
          buildDrawerHeader(name: _name, urlImage: _urlImage),
          const SizedBox(height: 24),
          Divider(
            height: 3,
            thickness: 1,
            color: Colors.grey,
          ),
          buildMenuItem(
              text: 'Login',
              icon: Icons.login,
              onTap: () => Navigator.of(context).pushNamed(AppRoutes.LOGIN)),
        ],
      ),
    ));
  }
}
