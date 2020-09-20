
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingMall/core/extension/int_extension.dart';
import 'package:shoppingMall/core/model/home_show_item.dart';
import 'package:shoppingMall/core/viewmodel/goods_view_model.dart';
import 'package:toast/toast.dart';

// ignore: must_be_immutable
class SHDetailBottomBar extends StatefulWidget {
  HomeShowItem _items;

  SHDetailBottomBar(this._items);

  @override
  _SHDetailBottomBarState createState() => _SHDetailBottomBarState();
}

class _SHDetailBottomBarState extends State<SHDetailBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58.px,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 8.px),
                    child: Column(
                      children: <Widget>[
                        Icon(Icons.satellite),
                        Text("客服")
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 8.px),
                    child: Column(
                      children: <Widget>[Icon(Icons.shop), Text("店铺")],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 8.px),
                    child: Column(
                      children: <Widget>[
                        Icon(Icons.favorite_border),
                        Text("收藏")
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: Consumer<SHGoodsViewModel>(
                      builder: (context, goodsVM, child){
                        return GestureDetector(
                          child: Container(
                            alignment: Alignment.center,
                            width: 100.px,
                            height: 80.px,
                            child: Text("加入购物车"),
                            color: Colors.yellow,
                          ),
                          onTap: (){
                            goodsVM.addItem(widget._items);
                            widget._items.count++;
                            widget._items.isChecked = true;
                            Toast.show("添加购物车成功", context, duration: Toast.LENGTH_SHORT, gravity: Toast.CENTER);
                          },
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      width: 100.px,
                      height: 80.px,
                      child: Text("购买"),
                      color: Colors.pinkAccent,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
