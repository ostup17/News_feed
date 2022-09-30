import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_work/features/presentation/config.dart';
import 'package:test_work/features/presentation/details/details.dart';
import 'package:test_work/features/presentation/favorites/favorites.dart';
import 'package:test_work/features/presentation/map/map.dart';
import 'package:test_work/features/presentation/news_feed/news_feed.dart';
import 'package:test_work/features/presentation/profile/profile.dart';

class News extends StatelessWidget {
  const News({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: NewsBody(),
    );
  }
}

class NewsBody extends StatefulWidget {
  const NewsBody({super.key});

  @override
  _NewsBodyState createState() => _NewsBodyState();
}

class _NewsBodyState extends State<NewsBody> {
  int _currentIndex = 0;
  static final List<Widget> _widgets = <Widget> [
    NewsFeed(),
    const MyMap(),
    Favorites(),
    const Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        backgroundColor: Colors.white,
        selectedItemColor: ColorConfig.buttonHome,
        unselectedItemColor: ColorConfig.black,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            label: 'Лента',
            icon: Icon(Icons.feed),
              activeIcon: Icon(Icons.feed, color: ColorConfig.buttonHome,)
          ),
          BottomNavigationBarItem(
            label: 'Карта',
            icon: Image.asset('assets/images/map.png'),
            activeIcon: Image.asset('assets/images/map.png', color: ColorConfig.buttonHome,)
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/favorite.png'),
            activeIcon: Image.asset('assets/images/favorite.png', color: ColorConfig.buttonHome,),
            label: 'Избранные',
          ),
          BottomNavigationBarItem(
            label: 'Профиль',
            icon: Image.asset('assets/images/profile.png'),
              activeIcon: Image.asset('assets/images/profile.png', color: ColorConfig.buttonHome,)
          ),
        ],
      ),
      body: _widgets.elementAt(_currentIndex),
    );
  }

}