import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_application_clone/common/bloc/favorite_button/favorite_button_cubit.dart';
import 'package:spotify_application_clone/common/bloc/favorite_button/favorite_button_state.dart';
import 'package:spotify_application_clone/common/helpers/is_dark_mode.dart';
import 'package:spotify_application_clone/core/configs/themes/app_color.dart';
import 'package:spotify_application_clone/domain/entities/song/song.dart';

class FavoriteButton extends StatelessWidget {
  final SongEntity songEntity;
  const FavoriteButton({super.key, required this.songEntity});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteButtonCubit(),
      child: BlocBuilder<FavoriteButtonCubit, FavouriteButtonState>(
        builder: (context, state) {
          if (state is FavouriteButtonInitial) {
            return IconButton(
                onPressed: () {
                  context
                      .read<FavoriteButtonCubit>()
                      .favoriteButtonUpdated(songEntity.songId);
                },
                icon: Icon(
                  songEntity.isFavourite
                      ? Icons.favorite
                      : Icons.favorite_outline_outlined,
                  size: 25,
                  color: context.isDarkMode
                      ? AppColors.darkGrey
                      : const Color(0xffE6E6E6),
                ));
          }
          if (state is FavoriteButtonUpdated) {
            return IconButton(
                onPressed: () {
                  context
                      .read<FavoriteButtonCubit>()
                      .favoriteButtonUpdated(songEntity.songId);
                },
                icon: Icon(
                  state.isFavourite
                      ? Icons.favorite
                      : Icons.favorite_outline_outlined,
                  size: 25,
                  color: context.isDarkMode
                      ? AppColors.darkGrey
                      : const Color(0xffE6E6E6),
                ));
          }
          return Container();
        },
      ),
    );
  }
}
