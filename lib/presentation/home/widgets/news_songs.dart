import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_application_clone/common/helpers/is_dark_mode.dart';
import 'package:spotify_application_clone/core/configs/themes/app_color.dart';
import 'package:spotify_application_clone/core/constant/app_urls.dart';
import 'package:spotify_application_clone/domain/entities/song/song.dart';
import 'package:spotify_application_clone/presentation/home/bloc/news_songs_cubit.dart';
import 'package:spotify_application_clone/presentation/home/bloc/news_songs_state.dart';
import 'package:spotify_application_clone/presentation/song_player/pages/song_player.dart';

class NewsSongs extends StatelessWidget {
  const NewsSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewsSongscubit()..getNewsSongs(),
      child: SizedBox(
          height: 200,
          child: BlocBuilder<NewsSongscubit, NewsSongsState>(
            builder: (context, state) {
              // log(state.toString());
              if (state is NewsSongsLoading) {
                log("iscoming");
                return Container(
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator());
              }
              if (state is NewsSongsLoaded) {
                // log(state.songs.toString());
                return _songs(state.songs);
              }

              return Container();
            },
          )),
    );
  }

  Widget _songs(List<SongEntity> songs) {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SongPlayerPage(songEntity: songs[index],),)),
            child: SizedBox(
              width: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                Appurl.getSongCoverUrl(
                                    songs[index].title.toString()),
                              ))),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          height: 40,
                          width: 40,
                          transform: Matrix4.translationValues(10, 20, 0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: context.isDarkMode ? AppColors.darkGrey : Color(0xffE6E6E6),
                          ),
                         child: Icon(
                          Icons.play_arrow_rounded,
                          color: context.isDarkMode ? const Color(0xff959595):
                           Color(0xff555555)
                          ,
                         ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    songs[index].title.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        overflow: TextOverflow.ellipsis),
                  ),
                  Text(
                    songs[index].artist.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
              width: 14,
            ),
        itemCount: songs.length);
  }
}
