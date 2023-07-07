import 'package:flutter/foundation.dart';

class Video {
  String songImageUrl;
  String channelImageUrl;
  String songTitle;
  String channelName;
  String videoId;
  Video(
      {required this.songImageUrl,
      required this.channelImageUrl,
      required this.songTitle,
      required this.videoId,
      required this.channelName});
  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
        songImageUrl: json["snippet"]["thumbnails"]["medium"]["url"],
        channelImageUrl: "",
        videoId: json["id"]["videoId"],
        songTitle: json["snippet"]["title"],
        channelName: json["snippet"]["channelTitle"]);
  }
}
