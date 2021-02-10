import 'package:flutter/material.dart';

// Widgets
import 'package:love_app/src/widgets/custom_appbar.dart';

class _ImagesText {
  final String text, image;

  _ImagesText(this.text, this.image);
}

class PhotosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              PhotosGrid(),
              Positioned(
                  top: 0,
                  child: CustomAppBar(
                    color: Colors.purple,
                  )),
            ],
          )),
    );
  }
}

class PhotosGrid extends StatelessWidget {
  final List<_ImagesText> images = [
    _ImagesText('Princesa mía', 'assets/images/image1.jpg'),
    _ImagesText('¿Quisieras', 'assets/images/image2.jpg'),
    _ImagesText('Casarte', 'assets/images/image3.jpg'),
    _ImagesText('Conmigo?', 'assets/images/image4.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: images.length,
      itemBuilder: (BuildContext context, int i) {
        final item = images[i];
        return Container(
          height: size.height * 0.5,
          child: Stack(
            children: [
              Image(
                image: AssetImage(item.image),
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
              MaterialButton(
                onPressed: () {},
                child: Container(
                    alignment: Alignment.center,
                    width: size.width,
                    height: double.infinity,
                    child: Text(
                      item.text,
                      style: TextStyle(
                          fontSize: 48.0,
                          fontFamily: 'Abel',
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )),
              )
            ],
          ),
        );
      },
    );
  }
}
