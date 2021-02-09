import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 220,
      decoration: BoxDecoration(
          color: Colors.purple[800],
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50.0),
              bottomRight: Radius.circular(50.0)),
          boxShadow: [
            BoxShadow(
                color: Colors.black26, blurRadius: 40.0, offset: Offset(0, 2))
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _Content(),
        ],
      ),
    );
  }
}

class _Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 36),
      child: Column(
        children: [
          Text(
            'Para mi hermosa princesa',
            style: TextStyle(
                fontSize: 26,
                color: Colors.white.withOpacity(0.8),
                fontWeight: FontWeight.bold,
                fontFamily: 'Sacramento'),
          ),
          Text(
            'Dionelvy Aguilera',
            style: TextStyle(
                fontSize: 42,
                color: Colors.white.withOpacity(0.9),
                fontWeight: FontWeight.bold,
                fontFamily: 'DancingScript'),
          ),
        ],
      ),
    );
  }
}
