
import 'package:douban/model/home_model.dart';
import 'package:douban/widgets/dashed_line.dart';
import 'package:douban/widgets/star_rating.dart';
import 'package:flutter/material.dart';

class HYHomeMovieItem extends StatelessWidget {
  final MovieItem movie;

  HYHomeMovieItem(this.movie);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 8,
            color: Color(0xffeeeeee)
          )
        )
      ),
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildHeader(),
          SizedBox(height: 8,),
          bulidContent(),
          SizedBox(height: 8,),
          buildFooter(),
        ],
      ),
    );
  }

//  1.头部的排名
  Widget buildHeader() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: Color.fromARGB(255, 238, 205, 144)
      ),
      child: Text("NO.${movie.rank}", style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 131, 95, 36)),),
    );
  }

//  2.内容的布局
  Widget bulidContent() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        buildContentImage(),
        SizedBox(width: 5,),
        Expanded(
          child: IntrinsicHeight(
            child: Row(
              children: <Widget>[
                buildContentInfo(),
                SizedBox(width: 5,),
                buildContentLine(),
                SizedBox(width: 5,),
                buildContentWish()
              ],
            ),
          ),
        )
      ],
    );
  }

//  2.1 内容的图片
  Widget buildContentImage() {
    return ClipRRect(
        child: Image.network(movie.imageURL, width: 100,),
      borderRadius: BorderRadius.circular(8),
    );
  }

//  2.2 内容的信息
  Widget buildContentInfo() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildContentInfoTitle(),
          SizedBox(height: 5,),
          buildContentInfoRate(),
          SizedBox(height: 5,),
          buildContentInfoDesc(),
        ],
      ),
    );
  }

  Widget buildContentInfoTitle() {
    return Text.rich(
        TextSpan(
          children: [
            WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: Icon(Icons.play_circle_outline, color: Colors.pink, size: 24,)
            ),
            ...movie.title.runes.map((e) {
              return WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: Text(
                  String.fromCharCode(e),
                  style: TextStyle(fontSize: 20,
                      fontWeight: FontWeight.bold),)
              );
            }),
            WidgetSpan(
                alignment: PlaceholderAlignment.middle,
              child: Text("${movie.playDate}", style: TextStyle(fontSize: 18, color: Colors.grey))
            )
          ]
        )
    );
  }

  Widget buildContentInfoRate() {
    return FittedBox(
      child: Row(
        children: <Widget>[
          HYStarRating(rating: movie.rating, size: 20,),
          Text("${movie.rating}", style: TextStyle(fontSize: 20),)
        ],
      ),
    );
  }

  Widget buildContentInfoDesc() {
//    1.字符串拼接
    final genresString = movie.genres.join(" ");
    final directorString = movie.director.map((e) => e).join();
    final actorString = movie.casts.map((e) => e).join(" ");

    return Text(
      "$genresString / $directorString / $actorString",
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontSize: 16),
    );
  }

//  2.3内容的虚线
  Widget buildContentLine() {
    return Container(
      height: 150,
      child: HYDashedLine(
        axis: Axis.vertical,
        dashedHeight: 5,
        dashedWidth: .5,
        count: 15,
        color: Colors.grey,
      ),
    );
  }

//  2.4内容的想看
  Widget buildContentWish() {
    return Container(
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset("assets/images/home/wish.png"),
          Text("想看", style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 235, 170, 60)),)
        ],
      ),
    );
  }

  Widget buildFooter() {
    return Container(
      height: 30,
      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: Color(0xffe2e2e2)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("${movie.originalTitle}", style: TextStyle(fontSize: 20, color: Color(0xff666666)),),
        ],
      ),
    );
  }
}






