import 'dart:ui';
import 'package:flutter/material.dart';

// Widgets
import 'package:love_app/src/widgets/header.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.centerLeft, colors: [
            Colors.purple,
            Colors.purpleAccent,
          ]),
        ),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Hero(tag: 'page', child: Header()),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      width: double.infinity,
                      child: _createButtonRounded(
                          color: Colors.purple[800],
                          icon: Icons.favorite,
                          text: '¡Te amo muchooo!',
                          onPress: () =>
                              Navigator.pushNamed(context, 'sliders'))),
                  _buttonsRounded(context),
                  Container(
                    width: double.infinity,
                    child: _createButtonRounded(
                        color: Colors.black87,
                        icon: Icons.markunread,
                        text: 'Carta',
                        onPress: () => Navigator.pushNamed(context, 'letter')),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buttonsRounded(BuildContext context) {
  return Table(
    children: [
      TableRow(children: [
        _createButtonRounded(
            color: Colors.blueAccent,
            icon: Icons.collections,
            text: 'Fotos',
            onPress: () => Navigator.pushNamed(context, 'photos')),
        _createButtonRounded(
            color: Colors.pink,
            icon: Icons.headset_outlined,
            text: 'Canción',
            onPress: () => Navigator.pushNamed(context, 'music')),
      ]),
      TableRow(children: [
        _createButtonRounded(
            color: Colors.orange,
            icon: Icons.local_florist,
            text: 'Girasol',
            onPress: () => Navigator.pushNamed(context, 'sunflower')),
        _createButtonRounded(
            color: Colors.indigo,
            icon: Icons.movie_filter,
            text: 'Vídeo',
            onPress: () => Navigator.pushNamed(context, 'video')),
      ]),
    ],
  );
}

Widget _createButtonRounded(
    {Color color, IconData icon, String text, Function onPress}) {
  return Container(
    height: 180.0,
    margin: EdgeInsets.all(15.0),
    decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(20.0), boxShadow: [
      BoxShadow(
          color: Colors.black26,
          spreadRadius: 0.4,
          blurRadius: 12.0,
          offset: Offset(0, 6))
    ]),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: MaterialButton(
            onPressed: onPress,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: color,
                  radius: 35.0,
                  child: Icon(icon, color: Colors.white),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  text,
                  style: TextStyle(color: color, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
