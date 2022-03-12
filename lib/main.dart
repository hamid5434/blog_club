import 'package:blog_club/article.dart';
import 'package:blog_club/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'common/theme.dart';
import 'home.dart';

void main() {
  // SystemChrome.setSystemUIOverlayStyle(
  //   const SystemUiOverlayStyle(
  //     statusBarColor: Colors.white,
  //     statusBarIconBrightness: Brightness.dark,
  //     systemNavigationBarColor: Colors.white,
  //     systemNavigationBarIconBrightness: Brightness.dark,
  //   ),
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blug Club',
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: Stack(
        children: const [
          Positioned.fill(
            child: MainScreen(),
          ),
          // Positioned(
          //   bottom: 0,
          //   left: 0,
          //   right: 0,
          //   child: BottomNavigation(),
          // ),
        ],
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

const int HOMEINDEX = 0;
const int ARTICLEINDEX = 1;
const int SEARCHINDEX = 2;
const int PROFILEINDEX = 3;

class _MainScreenState extends State<MainScreen> {
  int selectedScreenIndex = HOMEINDEX;

  List<int> _history = [];

  GlobalKey<NavigatorState> _homeKey = GlobalKey();
  GlobalKey<NavigatorState> _articleKey = GlobalKey();
  GlobalKey<NavigatorState> _searchKey = GlobalKey();
  GlobalKey<NavigatorState> _profileKey = GlobalKey();

  late final map = {
    HOMEINDEX: _homeKey,
    ARTICLEINDEX: _articleKey,
    SEARCHINDEX: _searchKey,
    PROFILEINDEX: _profileKey,
  };

  Future<bool> onWillPop() async {
    final NavigatorState currentSelectedTabNavigatorState =
        map[selectedScreenIndex]!.currentState!;
    if (currentSelectedTabNavigatorState.canPop()) {
      currentSelectedTabNavigatorState.pop();
      return false;
    } else if (_history.isNotEmpty) {
      setState(() {
        selectedScreenIndex = _history.last;
        _history.removeLast();
      });
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
            body: Stack(
          children: [
            Positioned.fill(
              bottom: 65,
              child: IndexedStack(
                index: selectedScreenIndex,
                children: [
                  Navigator(
                    key: _homeKey,
                    onGenerateRoute: (settings) => MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  ),
                  Navigator(
                    key: _articleKey,
                    onGenerateRoute: (settings) => MaterialPageRoute(
                      builder: (context) => ArticleScreen(),
                    ),
                  ),
                  Navigator(
                    key: _searchKey,
                    onGenerateRoute: (settings) => MaterialPageRoute(
                      builder: (context) => SearchScreen(),
                    ),
                  ),
                  Navigator(
                    key: _profileKey,
                    onGenerateRoute: (settings) => MaterialPageRoute(
                      builder: (context) => ProfileScreen(),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: BottomNavigation(
                onTab: (int index) {
                  setState(() {
                    _history.remove(selectedScreenIndex);
                    _history.add(selectedScreenIndex);
                    selectedScreenIndex = index;
                  });
                },
                selectIndex: selectedScreenIndex,
              ),
            ),
          ],
        )),
        onWillPop: onWillPop);
  }
}

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Search'),
    );
  }
}
