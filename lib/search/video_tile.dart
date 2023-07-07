import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karaoke/search/video.dart';
import 'package:karaoke/search/video_ui.dart';

class VideoTile extends StatelessWidget {
  Video video;
  VideoTile({required this.video});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(Null),
      child: Column(
        children: [
          Image.network(
            video.songImageUrl,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black,
            padding: EdgeInsets.only(top: 10, bottom: 25, right: 10, left: 10),
            child: Row(
              children: [
                // CircleAvatar(
                //   child: Image.network(video.channelImageUrl),
                // ),
                // SizedBox(
                //   width: 10,
                // ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width - 20,
                      child: Text(
                        video.songTitle,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Row(
                      children: [
                        Text(video.channelName,
                            style: TextStyle(color: Colors.white)),
                        // Text("664k views.",
                        //     style: TextStyle(color: Colors.white)),
                        // Text("5 month ago",
                        //     style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
