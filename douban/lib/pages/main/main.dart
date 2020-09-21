import 'package:douban/pages/main/initialize_items.dart';
import 'package:flutter/material.dart';

class HYMainPage extends StatefulWidget {
  @override
  _HYMainPageState createState() => _HYMainPageState();
}

class _HYMainPageState extends State<HYMainPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 14,
        unselectedFontSize: 14,
        selectedItemColor: Colors.orange,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: items,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
//  BottomNavigationBarItem buildBottomItem(title) {
//   return BottomNavigationBarItem(
//        title: Text(title),
//        icon: Image.asset("assets/images/tabbar/subject.png", width: 40),
//        activeIcon: Image.asset("assets/images/tabbar/subject_active.png", width: 40)
//    );
//  }
}


