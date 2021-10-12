import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/view/favorite_comic.dart';
import 'package:mini_project/view/home_page.dart';
import 'package:mini_project/view/category_comic.dart';
import 'package:mini_project/view/profile.dart';

class MyNavigationBar extends StatefulWidget {
  // MyNavigationBar({Key? key}) : super(key: key);

  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  int _currentIndex = 0;
  static List<Widget> _widgetOption = <Widget>[
    HomePage(),
    CategoryComic(),
    FavoriteComic(),
    Profile()
  ];

  //cara ke2 pake onTap
  // void _onTapItem(int index) {
  //   setState(() {
  //     _currentIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOption.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        iconSize: 25,
        backgroundColor: Colors.black87,
        selectedItemColor: Colors.white,
        unselectedItemColor: Color(0xfff908E8E),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "Category"),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_outline), label: "Favorite"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined), label: "Profile"),
        ],
        //cara pertama pake onTap
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
