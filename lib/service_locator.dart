import 'package:get_it/get_it.dart';
import 'package:spotify_application_clone/data/repository/auth/auth_repository_impl.dart';
import 'package:spotify_application_clone/data/repository/song/song_repository.dart';
import 'package:spotify_application_clone/data/source/auth/auth_firebase_service.dart';
import 'package:spotify_application_clone/data/source/song/song_firebasae_service.dart';
import 'package:spotify_application_clone/domain/repository/auth/auth.dart';
import 'package:spotify_application_clone/domain/repository/song/song.dart';
import 'package:spotify_application_clone/domain/usecases/auth/signin.dart';
import 'package:spotify_application_clone/domain/usecases/auth/signup.dart';
import 'package:spotify_application_clone/domain/usecases/song/add_or_remove_favourite_song.dart';
import 'package:spotify_application_clone/domain/usecases/song/get_new_songs.dart';
import 'package:spotify_application_clone/domain/usecases/song/get_playlist.dart';
import 'package:spotify_application_clone/domain/usecases/song/is_favourite_song.dart';

final s1 = GetIt.instance;

Future<void> initializeDependancies() async {
  s1.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());

  s1.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  s1.registerSingleton<SignUpUsecaase>(SignUpUsecaase());

  s1.registerSingleton<SigninUsecaase>(SigninUsecaase());

  s1.registerSingleton<SongFirebaseService>(SongFirebaseServiceImpl());

  GetIt.instance.registerSingleton<SongsRepository>(SongsRepositoryImpl());

  s1.registerSingleton<GetNewsSongUsecaase>(GetNewsSongUsecaase());

  s1.registerSingleton<GetnewsPlaySong>(GetnewsPlaySong());

  s1.registerSingleton<IsFavoriteSongUseCase>(IsFavoriteSongUseCase());

  s1.registerSingleton<AddOrRemoveFavouriteSongsUsecase>(
      AddOrRemoveFavouriteSongsUsecase());
}
