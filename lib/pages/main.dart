import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:studio_andy_app/pages/index.dart';
import 'package:studio_andy_app/bloc/post_provider.dart';

class MainPage extends StatefulWidget {
  MainPage();

  @override
  _MainPageState createState() => new _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  _MainPageState();

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.collections)),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.bookmark)),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.search)),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (context) {
            switch (index) {
              case 0:
                return PostProvider(
                  child: IndexPage(),
                );
                break;
              case 1:
                return PostProvider(
                  child: IndexPage(),
                );
                break;
              case 2:
                return PostProvider(
                  child: IndexPage(),
                );
                break;
            }
          },
        );
      },
    );
  }
}
