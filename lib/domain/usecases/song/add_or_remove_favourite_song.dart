import 'package:dartz/dartz.dart';
import 'package:spotify_application_clone/core/usecase/usecase.dart';
import 'package:spotify_application_clone/domain/repository/song/song.dart';
import 'package:spotify_application_clone/service_locator.dart';

class  AddOrRemoveFavouriteSongsUsecase implements UseCase<Either,String>{
  @override
  Future<Either> call({String ? parmas}) async{
   return await s1<SongsRepository>().addOrRemoveFavoriteSongs(parmas!);
  }

}