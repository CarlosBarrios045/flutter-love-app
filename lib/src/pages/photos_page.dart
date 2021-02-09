import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:love_app/src/widgets/custom_appbar.dart';

class PhotosPage extends StatelessWidget {
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
  final List items = List.generate(200, (i) => i);

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 2,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => _PhotoItem(index),
      staggeredTileBuilder: (int index) =>
          StaggeredTile.count(1, index.isEven ? 2 : 3),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class _PhotoItem extends StatelessWidget {
  final int index;

  _PhotoItem(this.index);

  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: EdgeInsets.all(6),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Center(
          child: CircleAvatar(
            backgroundColor: Colors.redAccent,
            child: Text(
              '$index',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ));
  }
}
