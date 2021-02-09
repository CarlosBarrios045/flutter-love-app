import 'package:flutter/material.dart';

// Widgets
import 'package:love_app/src/widgets/custom_appbar.dart';

class LetterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.centerLeft, colors: [
              Colors.purple,
              Colors.purpleAccent,
            ]),
          ),
          child: Column(
            children: [
              CustomAppBar(),
              Expanded(
                  child: Container(
                child: Text(
                  'Princesaaa',
                  style: TextStyle(
                      fontSize: 18, color: Colors.white.withOpacity(0.9)),
                ),
              ))
            ],
          )),
    );
  }
}
