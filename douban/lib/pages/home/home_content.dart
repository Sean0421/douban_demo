
import 'package:douban/model/home_model.dart';
import 'package:douban/service/home_request.dart';
import 'package:flutter/material.dart';

import 'home_movie_item.dart';

class HYHomeContent extends StatefulWidget {
  @override
  _HYHomeContentState createState() => _HYHomeContentState();
}

class _HYHomeContentState extends State<HYHomeContent> {
  final List<MovieItem> movies = [];

  @override
  void initState() {
    super.initState();

//    1.发送网络请求
    HomeRequest.requestMovieList(0).then((value) {
      setState(() {
        movies.addAll(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (BuildContext context, int index) {
        return HYHomeMovieItem(movies[index]);
      },
    );
  }
}
