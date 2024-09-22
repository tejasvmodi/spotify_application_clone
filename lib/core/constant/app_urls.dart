class Appurl {
  static const firestore = 'https://firebasestorage.googleapis.com/v0/b/sportify010101.appspot.com/o/covers%2F';
 static const SongFirestore = 'https://firebasestorage.googleapis.com/v0/b/sportify010101.appspot.com/o/songs%2F';
  static const mediaAt= 'alt=media';

static String getSongCoverUrl(String songTitle) {
  
  String encodedTitle = Uri.encodeComponent(songTitle.trim());
 
  return '$firestore$encodedTitle.jpg?$mediaAt';
}

}