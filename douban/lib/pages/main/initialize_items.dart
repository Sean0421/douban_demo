import 'bottom_bar_item.dart';
import 'package:flutter/material.dart';
import '../home/home.dart';
import '../subject/subject.dart';
import '../group/group.dart';

List<HYBottomBarItem> items = [
  HYBottomBarItem("home", "首页"),
  HYBottomBarItem("subject", "书音影"),
  HYBottomBarItem("group", "小组"),
  HYBottomBarItem("mall", "市集"),
  HYBottomBarItem("profile", "我的"),
];

List<Widget> pages = [
  HYHomePage(),
  HYSubjectPage(),
  HYSubjectPage(),
  HYSubjectPage(),
  HYSubjectPage(),
];