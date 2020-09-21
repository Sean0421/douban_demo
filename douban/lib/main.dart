import 'package:douban/pages/main/main.dart';
import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
        primarySwatch: Colors.green,
          splashColor: Colors.transparent,
        highlightColor: Colors.transparent
      ),
      debugShowCheckedModeBanner: false,
      home: HYMainPage(),
    );
  }
}



