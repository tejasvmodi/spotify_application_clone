import 'package:spotify_application_clone/core/usecase/usecase.dart';
import 'package:spotify_application_clone/domain/repository/song/song.dart';
import 'package:spotify_application_clone/service_locator.dart';

class  IsFavoriteSongUseCase implements UseCase<bool,String>{
  @override
  Future<bool> call({String ? parmas}) async {
    
    return await s1<SongsRepository>().isFavourite(parmas!);
    
  }
  
}