import 'package:flutter/material.dart' show ChangeNotifier, AnimationController;
import 'package:assets_audio_player/assets_audio_player.dart'
    show
        AssetsAudioPlayer,
        Audio,
        AudioFocusStrategy,
        Metas,
        MetasImage,
        NotificationSettings,
        PlayInBackground;

class MusicPlayerModel with ChangeNotifier {
  // Audio
  Duration _songDuration = new Duration(milliseconds: 0);
  Duration _currentTime = new Duration(milliseconds: 0);
  AnimationController _controller;
  AssetsAudioPlayer musicPlayer = AssetsAudioPlayer();

  // Widgets
  AnimationController get controller => this._controller;
  set controller(AnimationController value) => this._controller = value;

  String get songTotalDuration => this.printDuration(this._songDuration);
  String get currentTotalTime => this.printDuration(this._currentTime);

  startMusic() {
    if (!musicPlayer.isPlaying.value) {
      musicPlayer.open(
          Audio("assets/audios/song.mp3",
              metas: Metas(
                title: "Estrella fugaz",
                artist: "Lúa",
                album: "¡Te amooo!",
                image: MetasImage.asset(
                    "assets/images/image.jpg"), //can be MetasImage.network
              )),
          showNotification: true,
          notificationSettings: notificationsSettings(),
          playInBackground: PlayInBackground.enabled,
          audioFocusStrategy: AudioFocusStrategy.request(
              resumeAfterInterruption: true,
              resumeOthersPlayersAfterDone: true),
          autoStart: false);
      _listenDataSong();
    }
  }

  _listenDataSong() {
    musicPlayer.currentPosition.listen((duration) {
      _currentTime = duration;
      notifyListeners();
    });

    musicPlayer.current.listen((event) {
      _songDuration = event.audio.duration;
      notifyListeners();
    });
  }

  playOrPause() {
    musicPlayer.playOrPause();
    notifyListeners();
  }

  NotificationSettings notificationsSettings() {
    return NotificationSettings(
      customPlayPauseAction: (AssetsAudioPlayer musicProvider) {
        this.playOrPause();
      },
      customStopAction: (AssetsAudioPlayer musicProvider) {
        musicPlayer.stop();
        notifyListeners();
      },
    );
  }

  double get porcent => this._songDuration.inSeconds > 0
      ? this._currentTime.inSeconds / this._songDuration.inSeconds
      : 0;

  bool get isPlaying => musicPlayer.isPlaying.value;

  String printDuration(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    // return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
    return "$twoDigitMinutes:$twoDigitSeconds";
  }
}
