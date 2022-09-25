import 'package:flutter/material.dart';
import 'package:new_movies_app/home/browse_page/browse_main.dart';
import 'package:new_movies_app/home/home_page/home_screen.dart';
import 'package:new_movies_app/home/search_page/search_screen.dart';
import 'package:new_movies_app/home/watchlist_page/watchlist_screen.dart';

class MainScreen extends StatefulWidget {
  static const String routeName = 'MainScreen';

  MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
                backgroundColor:Colors.grey,
                icon: ImageIcon(
                  AssetImage('assets/images/homeicon.png'),
                ),
                label: 'Home',
            ),
            BottomNavigationBarItem(
              backgroundColor:Colors.grey,
              icon: ImageIcon(
                AssetImage('assets/images/search.png'),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              backgroundColor:Colors.grey,
              icon: ImageIcon(
                AssetImage('assets/images/movieicon.png'),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              backgroundColor:Colors.grey,
              icon: ImageIcon(
                AssetImage('assets/images/watchlisticon.png'),
              ),
              label: 'Home',
            ),

          ],
        ),
        body: tabs[selectedIndex],
      ),
    );
  }

  List<Widget> tabs = [
    HomeScreen(),
    BrowseScreen(),
    SearchScreen(),
    WatchListScreen(),
  ];
}
