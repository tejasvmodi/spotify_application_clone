import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:spotify_application_clone/presentation/song_player/bloc/song_player_state.dart';

class SongPlayerCubit extends Cubit<SongPlayerState> {
  Duration songduration = Duration.zero;
  Duration songposition = Duration.zero;
  AudioPlayer audioPlayer = AudioPlayer();

  SongPlayerCubit() : super(SongPlayerLoading()) {
    audioPlayer.positionStream.listen((position) {
      songposition= position;
      updateSongPlayer();
    });

    audioPlayer.durationStream.listen((event) {
      songduration = event!;
    });
  }
  Future<void> loadsong(String url) async {
    try {
      await audioPlayer.setUrl(url);
      emit(SongPlayerLoaded());
    } catch (e) {
      emit(SongPlayerFailure());
    }
  }

  void updateSongPlayer(){
    emit(
      SongPlayerLoaded()
    );
  }

  void playorpauseSong() {
    if (audioPlayer.playing) {
      audioPlayer.stop();
    } else {
      audioPlayer.play();
    }
    emit(SongPlayerLoaded());
  }

  @override
  Future<void> close() {
    audioPlayer.dispose();
    return super.close();
  }
}
