import 'package:flutter/material.dart';

class HYBottomBarItem extends BottomNavigationBarItem {
  HYBottomBarItem(String iconName, String title): super (
      title: Text(title),
      icon: Image.asset("assets/images/tabbar/$iconName.png", width: 40, gaplessPlayback: true,),
      activeIcon: Image.asset("assets/images/tabbar/${iconName}_active.png", width: 40, gaplessPlayback: true,)
  );
}