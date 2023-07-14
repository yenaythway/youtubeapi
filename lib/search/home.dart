import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'p_videotile.dart';
import 'search_bar_ui.dart';
import 'search_controller.dart';
import 'video_tile.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final SearchBarController _searchController = Get.put(SearchBarController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black,
          title: Text("Night Dance"),
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(Search());
                  //showSearch(context: context, delegate: CustomSearch());
                },
                icon: Icon(Icons.search))
          ],
        ),
        body:
            // CustomScrollView(
            //   slivers: [
            // SliverAppBar(
            //   floating: true,
            //   title: Text("Youtube"),
            // ),
            // SliverSafeArea(
            //   sliver:
            // SliverPersistentHeader(
            //   // pinned: true,
            //   floating: true,
            //   delegate: SearchBarDelegate(),
            // ),
            // ),
            // SliverToBoxAdapter(
            //   child:
            // ),
            FutureBuilder(
          future: _searchController
              .fetchMostPopular(), // Step 3: Replace 'fetchData' with your data fetching function
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              Future.delayed(
                Duration(seconds: 2),
              );
              return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.black,
                  child: Center(
                      child:
                          CircularProgressIndicator())); // Show a loading indicator while fetching data
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              // Step 5: Display your UI after loading data
              return Obx(() => ListView.builder(
                      itemCount: _searchController.mostPopular.length,
                      itemBuilder: ((context, index) => PVideoTile(
                            video: _searchController.mostPopular[index],
                          )))
                  // SliverList(
                  //     delegate: SliverChildBuilderDelegate(
                  // (context, index) => PVideoTile(
                  //       video: _searchController.mostPopular[index],
                  //     ), //
                  //         childCount: _searchController.mostPopular.length))
                  );
            }
          },
        )
        //   ],
        // ),
        );
  }
}

// class CustomSearch extends SearchDelegate {
//   final SearchBarController _searchController = Get.put(SearchBarController());
//   List<String> allData = ["Raymond", "Taylor Swift", "Ed Sheeran", "Beyoncé"];
//   @override
//   TextStyle? get searchFieldStyle => TextStyle(color: Colors.white);
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [IconButton(icon: Icon(Icons.clear), onPressed: () {})];
//   }
//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(
//         icon: Icon(Icons.arrow_back),
//         onPressed: () {
//           close(context, null);
//         });
//   }
//   @override
//   Widget buildResults(BuildContext context) {
//     // TODO: implement buildResults
//     return Obx(() => ListView.builder(
//         itemBuilder: (context, index) => VideoTile(
//               video: _searchController.videos[index],
//             ),
//         itemCount: _searchController.videos.length));
//   }
//   @override
//   void showResults(BuildContext context) {
//     // TODO: implement showResults
//     print(query);
//     _searchController.searchQuery.value = query;
//     // _searchController.getQuery;
//   }
//   ThemeData appBarTheme(BuildContext context) {
//     return ThemeData(
//       primaryTextTheme: TextTheme(),
//       textTheme: TextTheme(
//         titleSmall: TextStyle(color: Colors.white),
//       ),
//       appBarTheme: const AppBarTheme(
//         backgroundColor: Colors.black,
//       ),
//       textSelectionTheme: TextSelectionThemeData(
//         cursorColor: Colors.white,
//       ),
//       inputDecorationTheme: InputDecorationTheme(
//           border: InputBorder.none, hintStyle: TextStyle(color: Colors.white)),
//     );
//   }
//   @override
//   Widget buildSuggestions(BuildContext context) {
//     return ListView.builder(
//         itemBuilder: (BuildContext context, int index) {
//           return Text("${allData[index]}");
//         },
//         itemCount: allData.length);
//   }
// }
