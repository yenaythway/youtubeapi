import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'p_video.dart';
import 'video_ui.dart';

class PVideoTile extends StatelessWidget {
  PVideo video;
  PVideoTile({required this.video});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(VideoUi(id: video.videoId)),
      child: Column(
        children: [
          Divider(
            height: 1,
          ),
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
                        "Song name - ${video.songTitle}",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    // Row(
                    //   children: [
                    Container(
                      width: MediaQuery.of(context).size.width - 20,
                      child: Text("Channel - ${video.channelName}",
                          style: TextStyle(color: Colors.white)),
                    ),
                    // Text("664k views.",
                    //     style: TextStyle(color: Colors.white)),
                    // Text("5 month ago",
                    //     style: TextStyle(color: Colors.white)),
                    //   ],
                    // ),
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
