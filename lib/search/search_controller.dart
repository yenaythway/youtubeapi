import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:karaoke/search/video.dart';

import '../utilities/keys.dart';

class SearchBarController extends GetxController {
  RxString searchQuery = "".obs;
  RxList videos = [].obs;
  RxList channelIds = [].obs;

  // RxString videoId = "".obs;
  void getQuery(String value) {
    searchQuery.value = value;
    // print("##############${searchQuery.value}");
    getvideos(value);
  }

  void getvideos(String value) async {
    var response = await http.get(Uri.parse(
        "https://www.googleapis.com/youtube/v3/search?part=snippet&q=${searchQuery.value}&maxResults=15&key=${apikey}"));
    print("##############response${response.body}");
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body)["items"];
      print("##############data${data}");
      List<Video> videoList =
          List<Video>.from(data.map((e) => Video.fromJson(e)));
      // print(videoList);
      videos.value = videoList;
      print("##############videolist${videoList}");
      // return videoList;
      // data.map((e) => null)
      // channelIds.value = List.from(data.map((e) {
      //   return e["snippet"]["channelId"];
      // }));
      // print(channelIds);
      // print(data);
      // videoId.value = data[0]["id"]["videoId"];
      // print("######");
      // print(videoId);
      // videos.value = data;
    }
  }

  Future<void> fetchViewCount() async {
    // String apiKey = 'YOUR_API_KEY';
    var videoId = "";
    String apiUrl =
        'https://www.googleapis.com/youtube/v3/videos?part=statistics&id=$videoId&key=$apikey';

    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      Map<String, dynamic> data2 = jsonDecode(response.body);
      print("########");
      print(data2);
      int viewCount = int.parse(data2['items'][0]['statistics']['viewCount']);
      print("#############");
      print(viewCount);
      // return viewCount;
    } else {
      throw Exception('Failed to fetch view count');
    }
  }
}
