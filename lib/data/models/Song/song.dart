// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spotify_application_clone/domain/entities/song/song.dart';

class SongModel {
String ? title;
String ? artist;
String ? duration;
Timestamp ? releaseDate;
bool ? isFavourite;
String ? songId;

  SongModel({
    required this.title,
    required this.artist,
    required this.duration,
    required this.releaseDate,
    required this.isFavourite,
    required this.songId,
  });

  SongModel.fromjson(Map<String,dynamic> data){
    title = data['title'];
    artist = data['artist'];
    duration= data['duration'];
    releaseDate = data['releaseDate'];


  }
  
}

extension SongModelX on SongModel {

  SongEntity toEntity(){
    return SongEntity(title: title!, artist: artist!, duration: num.parse(duration!), releaseDate: releaseDate!, isFavourite: isFavourite!, songId: songId!);
  }
}
