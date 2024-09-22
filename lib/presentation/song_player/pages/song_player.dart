import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_application_clone/common/helpers/is_dark_mode.dart';
import 'package:spotify_application_clone/common/widgets/Favorite_button/favorite_button.dart';
import 'package:spotify_application_clone/common/widgets/appbar/app_bar.dart';
import 'package:spotify_application_clone/domain/entities/song/song.dart';
import 'package:spotify_application_clone/core/configs/themes/app_color.dart';
import 'package:spotify_application_clone/presentation/song_player/bloc/song_player_cubit.dart';
import 'package:spotify_application_clone/presentation/song_player/bloc/song_player_state.dart';
import '../../../core/constant/app_urls.dart';

class SongPlayerPage extends StatelessWidget {
  final SongEntity songEntity;
  const SongPlayerPage({super.key, required this.songEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: const Text(
          'Now playing',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        action: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.more_vert_rounded,
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) => SongPlayerCubit()
          ..loadsong(
              '${Appurl.SongFirestore}${songEntity.title}.mp3?${Appurl.mediaAt}'),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Column(
              children: [
                _songCover(context),
                const SizedBox(
                  height: 30,
                ),
                _songDetail(context),
                const SizedBox(
                  height: 30,
                ),
                _songPlayer(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _songCover(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                Appurl.getSongCoverUrl(songEntity.title.toString()),
              ))),
    );
  }

  Widget _songDetail(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                songEntity.title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: context.isDarkMode
                      ? Colors.white
                      : AppColors.darkBackground,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              Text(
                songEntity.artist,
                style: TextStyle(
                  color: context.isDarkMode
                      ? Colors.white
                      : AppColors.darkBackground,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
       FavoriteButton(songEntity: songEntity,),
      ],
    );
  }

  Widget _songPlayer(BuildContext context) {
    return BlocBuilder<SongPlayerCubit, SongPlayerState>(
      builder: (context, state) {
        if (state is SongPlayerLoading) {
          return const CircularProgressIndicator();
        }
        if (state is SongPlayerLoaded) {
          return Column(
            children: [
              Slider(
                value: context
                    .read<SongPlayerCubit>()
                    .songposition
                    .inSeconds
                    .toDouble(),
                min: 0.0,
                max: context
                    .read<SongPlayerCubit>()
                    .songduration
                    .inSeconds
                    .toDouble(),
                onChanged: (value) {},
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      formatDuration(
                          context.read<SongPlayerCubit>().songposition),
                    ),
                    Text(formatDuration(
                        context.read<SongPlayerCubit>().songduration))
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  context.read<SongPlayerCubit>().playorpauseSong();
                },
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.primary),
                  child: Icon(context.read<SongPlayerCubit>().audioPlayer.playing
                      ? Icons.pause
                      : Icons.play_arrow),
                ),
              ),
            ],
          );
        }
        return Container();
      },
    );
  }

  String formatDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}
