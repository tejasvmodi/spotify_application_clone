import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_application_clone/common/bloc/favorite_button/favorite_button_state.dart';
import 'package:spotify_application_clone/domain/usecases/song/add_or_remove_favourite_song.dart';
import 'package:spotify_application_clone/service_locator.dart';

class FavoriteButtonCubit extends Cubit<FavouriteButtonState>{

  FavoriteButtonCubit() : super(FavouriteButtonInitial());

  void favoriteButtonUpdated(String songId) async
{
  var result = await s1<AddOrRemoveFavouriteSongsUsecase>().call(
    parmas: songId
  );

  result.fold((l) {}, (isFavorite) {

 emit(
    FavoriteButtonUpdated(
    isFavourite : isFavorite
    )
 );

  });
}

}