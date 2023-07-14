import 'package:flutter/foundation.dart';

class PVideo {
  String songImageUrl;
  String channelImageUrl;
  String songTitle;
  String channelName;
  String videoId;
  PVideo(
      {required this.songImageUrl,
      required this.channelImageUrl,
      required this.songTitle,
      required this.videoId,
      required this.channelName});
  factory PVideo.fromJson(Map<String, dynamic> json) {
    // print("#########################${json["snippet"]["title"]}");
    return PVideo(
        songImageUrl: json["snippet"]["thumbnails"]["maxres"]["url"],
        channelImageUrl: "",
        videoId: json["id"],
        songTitle: json["snippet"]["title"],
        channelName: json["snippet"]["channelTitle"]);
  }
}
