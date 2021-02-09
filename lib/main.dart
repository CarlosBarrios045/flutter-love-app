import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemChrome, DeviceOrientation;
import 'package:provider/provider.dart';

// Pages
import 'package:love_app/src/pages/home_page.dart';
import 'package:love_app/src/pages/sliders_page.dart';
import 'package:love_app/src/pages/photos_page.dart';
import 'package:love_app/src/pages/music_player_page.dart';
import 'package:love_app/src/pages/sunflower_page.dart';
import 'package:love_app/src/pages/video_page.dart';
import 'package:love_app/src/pages/letter_page.dart';

// Models
import 'package:love_app/src/models/sliders_model.dart';
import 'package:love_app/src/models/music_player_model.dart';

// Theme
import 'package:love_app/src/theme/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MusicPlayerModel()),
        ChangeNotifierProvider(create: (_) => SliderModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Music Player',
        home: MusicPlayerPage(),
        theme: myTheme,
        initialRoute: 'home',
        routes: {
          'home': (_) => HomePage(),
          'photos': (_) => PhotosPage(),
          'music': (_) => MusicPlayerPage(),
          'sliders': (_) => SlidersPage(),
          'sunflower': (_) => SunflowerPage(),
          'video': (_) => VideoPlayerScreen(),
          'letter': (_) => LetterPage(),
        },
      ),
    );
  }
}
