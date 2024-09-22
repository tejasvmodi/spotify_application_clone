import 'package:dartz/dartz.dart';
import 'package:spotify_application_clone/core/usecase/usecase.dart';
import 'package:spotify_application_clone/domain/repository/song/song.dart';
import 'package:spotify_application_clone/service_locator.dart';

class  GetNewsSongUsecaase implements UseCase<Either,dynamic>{
  @override
  Future<Either> call({parmas}) async {
   return await s1<SongsRepository>().getNewsSongs();
  }
}