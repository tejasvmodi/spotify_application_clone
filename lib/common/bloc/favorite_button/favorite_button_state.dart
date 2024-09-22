abstract class FavouriteButtonState {}

class FavouriteButtonInitial extends FavouriteButtonState {}

class FavoriteButtonUpdated extends FavouriteButtonState {
  final bool isFavourite;

  FavoriteButtonUpdated({required this.isFavourite});

}