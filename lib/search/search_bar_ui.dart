import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karaoke/search/search_controller.dart';
import 'package:karaoke/search/video_tile.dart';

class Search extends StatelessWidget {
  final SearchBarController _searchController = Get.put(SearchBarController());
  Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: CustomScrollView(
        slivers: [
          // SliverAppBar(
          //   floating: true,
          //   title: Text("Youtube"),
          // ),
          // SliverSafeArea(
          //   sliver:
          SliverPersistentHeader(
            // pinned: true,
            floating: true,
            delegate: SearchBarDelegate(),
          ),
          // ),
          // SliverToBoxAdapter(
          //   child:
          // ),
          Obx(() => SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => VideoTile(
                        video: _searchController.videos[index],
                      ), //
                  childCount: _searchController.videos.length)))
        ],
      ),
    ));
  }
}

class SearchBarDelegate extends SliverPersistentHeaderDelegate {
  final SearchBarController _searchController = Get.put(SearchBarController());
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(color: Colors.black),
      child: TextField(
        // onChanged: _searchController.getQuery,
        onSubmitted: _searchController.getQuery,
        cursorColor: Colors.white,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          hintText: "Search",
          hintStyle: TextStyle(color: Colors.white),
          prefixIconColor: Colors.white,
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 70;

  @override
  double get minExtent => 70;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
