import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animate_do/animate_do.dart' show SpinPerfect;

// Models
import 'package:love_app/src/models/music_player_model.dart';

// Helpers
import 'package:love_app/src/helpers/helpers.dart';

// Widgets
import 'package:love_app/src/widgets/custom_appbar.dart';

class MusicPlayerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Background(),
          Column(
            children: [
              CustomAppBar(),
              ImageDiskDuration(),
              TitlePlay(),
              Expanded(
                child: Lyrics(),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.centerLeft, colors: [
        Colors.purple,
        Colors.purpleAccent,
      ])),
    );
  }
}

class ImageDiskDuration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      margin: EdgeInsets.only(top: 40),
      child: Row(
        children: [
          // Disk
          ImageDisk(),
          SizedBox(width: 40),

          // Progress Bar
          ProgressMusic(),
          SizedBox(width: 20)
        ],
      ),
    );
  }
}

class ImageDisk extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final audioPlayerModel = Provider.of<MusicPlayerModel>(context);

    return Container(
      padding: EdgeInsets.all(30),
      width: 250,
      height: 250,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(200),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              colors: [Color(0xff484750), Color(0xff1E1C24)])),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(200),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SpinPerfect(
              animate: false,
              duration: Duration(seconds: 10),
              infinite: true,
              manualTrigger: true,
              controller: (spinController) =>
                  audioPlayerModel.controller = spinController,
              child: Image(
                image: AssetImage('assets/images/image.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(100))),
            Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                    color: Color(0xff1C1C25),
                    borderRadius: BorderRadius.circular(100)))
          ],
        ),
      ),
    );
  }
}

class ProgressMusic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final audioPlayerModel = Provider.of<MusicPlayerModel>(context);
    final porcent = audioPlayerModel.porcent;

    return Container(
      child: Column(
        children: [
          Text(
            '${audioPlayerModel.songTotalDuration}',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Stack(children: [
            Container(
                width: 3, height: 230, color: Colors.white.withOpacity(0.1)),
            Positioned(
              bottom: 0,
              child: Container(
                  width: 3,
                  height: 230 * porcent,
                  color: Colors.white.withOpacity(0.8)),
            ),
          ]),
          SizedBox(height: 10),
          Text(
            '${audioPlayerModel.currentTotalTime}',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class TitlePlay extends StatefulWidget {
  @override
  _TitlePlayState createState() => _TitlePlayState();
}

class _TitlePlayState extends State<TitlePlay>
    with SingleTickerProviderStateMixin {
  AnimationController playAnimation;

  void runAnimations() {
    final musicPlayerModel =
        Provider.of<MusicPlayerModel>(context, listen: false);
    playAnimation.forward();
    musicPlayerModel.controller.repeat();
  }

  void stopAnimations() {
    final musicPlayerModel =
        Provider.of<MusicPlayerModel>(context, listen: false);
    playAnimation.reverse();
    musicPlayerModel.controller.stop();
  }

  void open() {
    final musicPlayerModel =
        Provider.of<MusicPlayerModel>(context, listen: false);

    musicPlayerModel.startMusic();
    if (musicPlayerModel.isPlaying) {
      runAnimations();
    }
  }

  @override
  void initState() {
    super.initState();

    playAnimation = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 500));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      open();
    });
  }

  @override
  void dispose() {
    playAnimation?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final musicPlayerModel = Provider.of<MusicPlayerModel>(context);

    if (musicPlayerModel.porcent == 1) stopAnimations();

    print(musicPlayerModel.isPlaying);
    if (musicPlayerModel.isPlaying) {
      runAnimations();
    } else {
      stopAnimations();
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50),
      margin: EdgeInsets.only(top: 40),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Estrella fugaz',
                style: TextStyle(
                    fontSize: 26, color: Colors.white.withOpacity(0.8)),
              ),
              Text(
                'Lúa',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          Spacer(),
          FloatingActionButton(
            elevation: 0,
            highlightElevation: 0,
            backgroundColor: Colors.purple[600],
            child: AnimatedIcon(
              icon: AnimatedIcons.play_pause,
              progress: playAnimation,
              color: Colors.white.withOpacity(0.8),
            ),
            onPressed: () {
              Provider.of<MusicPlayerModel>(context, listen: false)
                  .playOrPause();
            },
          )
        ],
      ),
    );
  }
}

class Lyrics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final lyris = getLyrics();
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: ListWheelScrollView(
        physics: BouncingScrollPhysics(),
        itemExtent: 42,
        diameterRatio: 1.5,
        children: lyris
            .map((e) => Text(e,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)))
            .toList(),
      ),
    );
  }
}
