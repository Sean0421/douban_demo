import 'package:flutter/material.dart';

class DashedLineDemo extends StatelessWidget {
  const DashedLineDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                width: 200, child: HYDashedLine(
              count: 15,
              dashedWidth: 10,
            )
            ),
            Container(
                height: 200, child: HYDashedLine(
              axis: Axis.vertical,
              count: 15,
              dashedHeight: 10,
            )
            )
          ],
        )
    );
  }
}

class HYDashedLine extends StatelessWidget {
  final Axis axis;
  final double dashedWidth;
  final double dashedHeight;
  final int count;
  final Color color;

  HYDashedLine({
    this.axis = Axis.horizontal,
    this.dashedWidth = 1,
    this.dashedHeight = 1,
    this.count = 10,
    this.color = Colors.red
  });

  @override
  Widget build(BuildContext context) {
    return Flex(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        direction: axis,
        children: List.generate(count, (_) {
          return SizedBox(
            width: dashedWidth,
            height: dashedHeight,
            child: DecoratedBox(
                decoration: BoxDecoration(
                    color: color
                )
            ),
          );
        })
    );
  }
}
