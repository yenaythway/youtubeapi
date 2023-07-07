import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoUi extends StatelessWidget {
  final String id;
  late YoutubePlayerController _controller;
  VideoUi({super.key, required this.id});
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId: id,
      flags: YoutubePlayerFlags(),
    );
  }

  @override
  Widget build(BuildContext context) {
    initState();
    return
        // Scaffold(
        //   appBar: AppBar(
        //     backgroundColor: Colors.black,
        //   ),
        // body:
        Stack(
      children: [
        // Container(
        //   color: Colors.black,
        // ),
        YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          // onReady: () {
          //   print('Player is ready.');
          // },
        ),
      ],
      // ),
    );
  }
}
