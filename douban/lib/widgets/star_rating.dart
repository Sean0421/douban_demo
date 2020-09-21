import 'package:flutter/material.dart';

class HYStarRating extends StatefulWidget {
  final double rating;
  final double maxRating;
  final int count;
  final double size;
  final Color unselectedColor;
  final Color selectedColor;

  final Widget unselectedImage;
  final Widget selectedImage;

  HYStarRating({
    @required this.rating,
    this.maxRating = 10,
    this.count = 5,
    this.size = 30,
    this.unselectedColor = const Color(0xffbbbbbb),
    this.selectedColor = const Color(0xffff0000),
    Widget unselectedImage,
    Widget selectedImage
  }) : unselectedImage = unselectedImage ?? Icon(Icons.star_border, size: size, color: unselectedColor,),
        selectedImage = selectedImage ?? Icon(Icons.star, size: size, color: selectedColor,);

  @override
  _HYStarRatingState createState() => _HYStarRatingState();
}

class _HYStarRatingState extends State<HYStarRating> {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Row(
            mainAxisSize: MainAxisSize.min, children: buildUnselectedStar()
        ),
        Row(
            mainAxisSize: MainAxisSize.min, children: buildSelectedStar()
        )
      ],
    );
  }
  List<Widget> buildUnselectedStar() {
    return List.generate(widget.count, (index) {
      return widget.unselectedImage;
    });
  }

  List<Widget> buildSelectedStar() {
    //1.创建stars
    List<Widget> stars = [];
    final star = widget.selectedImage;

    //2.构建满填充的star
    double oneValue = widget.maxRating / widget.count;
    int entireCount = (widget.rating / oneValue).floor();  //floor:向下取整， cell:向上取整
    for (var i = 0; i < entireCount; i++) {
      stars.add(star);
    }
    //3.构建部分填充star
    //(Widget.rating / oneValue) 3.5 - 3 = 0.5 * widget.size
    double leftWidth = ((widget.rating / oneValue) - entireCount) * widget.size;
    final partStar = ClipRect(
      clipper: HYStarClipper(leftWidth),
      child: star,
    );
    stars.add(partStar);

    if (stars.length > widget.count) {
      return stars.sublist(0, widget.count);
    }

    return stars;
  }
}

class HYStarClipper extends CustomClipper<Rect> {
  double leftWidth;

  HYStarClipper(this.leftWidth);

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 0, leftWidth, size.height);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return false;
  }
}