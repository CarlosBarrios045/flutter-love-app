import 'package:flutter/material.dart';

// Widgets
import 'package:love_app/src/widgets/custom_appbar.dart';

class SunflowerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Image(
              height: double.infinity,
              width: double.infinity,
              image: AssetImage('assets/images/sunflower.jpg'),
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 20,
              child: Container(
                  width: width,
                  height: 100,
                  child: Row(children: [
                    Spacer(),
                    Text(
                      'Para ti mi princesa',
                      style: TextStyle(
                          fontSize: 48,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Sacramento'),
                    ),
                    Spacer()
                  ])),
            ),
            Positioned(top: 0, child: CustomAppBar(color: Colors.purple)),
          ],
        ),
      ),
    );
  }
}
