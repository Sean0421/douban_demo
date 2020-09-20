import 'package:flutter/material.dart';
import 'package:shoppingMall/main.dart';
import 'package:shoppingMall/ui/detail/detail.dart';



class SHRouter{
  static final Map<String, WidgetBuilder> routes = {
  SHHomePage.routeName: (context) => SHHomePage(),
  SHHomeDetail.routeName: (context) => SHHomeDetail(),
  };

  static final initialRoute = SHHomePage.routeName;

}