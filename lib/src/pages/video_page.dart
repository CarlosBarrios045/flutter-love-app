import 'package:chewie/chewie.dart'
    show Chewie, ChewieController, ChewieProgressColors;
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart' show VideoPlayerController;

// Widgets
import 'package:love_app/src/widgets/custom_appbar.dart';

class VideoPlayerScreen extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const VideoPlayerScreen({this.title = 'Chewie Demo'});

  final String title;

  @override
  State<StatefulWidget> createState() {
    return _ChewieDemoState();
  }
}

class _ChewieDemoState extends State<VideoPlayerScreen> {
  VideoPlayerController _videoPlayerController;
  ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  Future<void> initializePlayer() async {
    _videoPlayerController =
        VideoPlayerController.asset('assets/videos/video.mp4');
    await _videoPlayerController.initialize();

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      allowPlaybackSpeedChanging: false,
      allowMuting: false,
      fullScreenByDefault: true,
      // Try playing around with some of these other options:

      // showControls: false,
      materialProgressColors: ChewieProgressColors(
        playedColor: Colors.purpleAccent,
        handleColor: Colors.purple,
        backgroundColor: Colors.purple,
        bufferedColor: Colors.purple,
      ),
      placeholder: Container(
        color: Colors.purple[800],
      ),
      // autoInitialize: true,
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.centerLeft, colors: [
            Colors.purple,
            Colors.purpleAccent,
          ]),
        ),
        child: Column(
          children: <Widget>[
            CustomAppBar(),
            Expanded(
              child: Center(
                child: _chewieController != null &&
                        _chewieController
                            .videoPlayerController.value.initialized
                    ? Chewie(
                        controller: _chewieController,
                      )
                    : Center(child: CircularProgressIndicator()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
