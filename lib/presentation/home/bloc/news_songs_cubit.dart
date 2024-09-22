import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_application_clone/domain/usecases/song/get_new_songs.dart';
import 'package:spotify_application_clone/presentation/home/bloc/news_songs_state.dart';
import 'package:spotify_application_clone/service_locator.dart';

class NewsSongscubit extends Cubit<NewsSongsState> {
  NewsSongscubit() : super(NewsSongsLoading());
  Future<void> getNewsSongs() async {
    log("Fetching news songs...");
    var returnedSongs = await s1<GetNewsSongUsecaase>().call();

    returnedSongs.fold(
      (l) {
        log("Failed to load songs: $l");
        if (!isClosed) {
          emit(NewsSongsLoadFailure());
        }
      },
      (data) {
        if (!isClosed) {
          emit(NewsSongsLoaded(songs: data));
        }
      },
    );
  }
}
