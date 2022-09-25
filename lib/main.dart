import 'package:flutter/material.dart';
import 'package:new_movies_app/home/browse_page/browse_main.dart';
import 'package:new_movies_app/home/home_page/home_screen.dart';
import 'package:new_movies_app/home/main_screen.dart';

import 'home/search_page/search_screen.dart';
import 'home/watchlist_page/watchlist_screen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        MainScreen.routeName:(_)=>MainScreen(),
        HomeScreen.routeName:(_)=>HomeScreen(),
        BrowseScreen.routeName:(_)=>BrowseScreen(),
        SearchScreen.routeName:(_)=>SearchScreen(),
        WatchListScreen.routeName:(_)=>WatchListScreen(),
      },
      initialRoute: MainScreen.routeName,

    );
  }
}
