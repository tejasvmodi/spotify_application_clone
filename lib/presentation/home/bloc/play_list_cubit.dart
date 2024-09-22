import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_application_clone/domain/usecases/song/get_playlist.dart';
import 'package:spotify_application_clone/presentation/home/bloc/play_list_state.dart';
import 'package:spotify_application_clone/service_locator.dart';

class PlayListCubit extends Cubit<PlayListState> {
  PlayListCubit() : super(PlayListLoading());
  Future<void> GetPlaySong() async {
    log("Fetching news songs...");
    var returnedSongs = await s1<GetnewsPlaySong>().call();

    returnedSongs.fold(
      (l) {
        log("Failed to load songs: $l");
        if (!isClosed) {
          emit(PlayListLoadFailure());
        }
      },
      (data) {
        if (!isClosed) {
          emit(PlayListLoaded(songs: data));
        }
      },
    );
  }
}
