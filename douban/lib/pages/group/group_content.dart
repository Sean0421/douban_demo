
import 'package:flutter/material.dart';

class HYGroupContent extends StatefulWidget {
  @override
  _HYHomeContentState createState() => _HYHomeContentState();
}

class _HYHomeContentState extends State<HYGroupContent> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("小组", style: TextStyle(fontSize: 30, color: Colors.purple),),
    );
  }
}
