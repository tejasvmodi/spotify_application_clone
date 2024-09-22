import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:spotify_application_clone/data/source/song/song_firebasae_service.dart';
import 'package:spotify_application_clone/domain/repository/song/song.dart';
import 'package:spotify_application_clone/service_locator.dart';

class SongsRepositoryImpl extends SongsRepository {
  @override
  Future<Either> getNewsSongs() async {
    log("layer 2");
    return await s1<SongFirebaseService>().getNewsSongs();
  }

  @override
  Future<Either> getPlayList() async {
    return await s1<SongFirebaseService>().getPlayList();
  }
  
  @override
  Future<Either> addOrRemoveFavoriteSongs(String songId) async{
   return await s1<SongFirebaseService>().addOrRemoveFavoriteSongs(songId);
  }
  
  @override
  Future<bool> isFavourite(String songId)async {
   return await s1<SongFirebaseService>().isFavouriteSong(songId);
  }
}
