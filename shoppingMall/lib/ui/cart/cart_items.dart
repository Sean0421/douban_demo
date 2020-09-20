
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingMall/core/model/home_show_item.dart';
import 'package:shoppingMall/core/viewmodel/goods_view_model.dart';

class SHCartItems extends StatefulWidget {
  @override
  _SHCartItemsState createState() => _SHCartItemsState();
}

class _SHCartItemsState extends State<SHCartItems> {
  bool isSelectAll = true;

  @override
  Widget build(BuildContext context) {
    return Consumer<SHGoodsViewModel>(
      builder: (context, goodsVM, child){
        if(goodsVM.items.length == 0){
          return Center(child: Text("购物车为空", style: TextStyle(fontSize: 20),),);
        }else{
          return Column(
            children: [
              Container(
                height: 595,
                child: ListView.builder(
                    itemCount: goodsVM.items.length,
                    itemBuilder: (context, index){
                      return Card(
                        child: Card(
                          elevation: 10,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    height:50,
                                    width: 50,
                                    child: FlatButton(
                                      padding: EdgeInsets.only(left: -10),
                                      //splashColor和highlightColor为了消除掉按钮点击产生的特效
                                      splashColor:Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      child: goodsVM.items[index].isChecked?Icon(Icons.check_circle_outline, color: Colors.pink,):Icon(Icons.check_circle_outline),
                                      onPressed: (){
                                        setState(() {
                                          goodsVM.items[index].isChecked = !goodsVM.items[index].isChecked;
                                        });
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Image.network(goodsVM.items[index].image, fit: BoxFit.cover,height: 150,width: 100,),
                                            Expanded(
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      height:70,
                                                        child: Text(goodsVM.items[index].title,overflow: TextOverflow.clip,)),
                                                    SizedBox(height: 35,),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                      children: [
                                                        SizedBox(
                                                          height:40,
                                                          width: 40,
                                                          child: FlatButton(
                                                            padding: EdgeInsets.only(left: -5),
                                                            shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(20)
                                                            ),
                                                            color: Colors.pink,
                                                            child: Icon(Icons.remove),
                                                            onPressed: (){
                                                              setState(() {
                                                                goodsVM.items[index].count--;
                                                                if(goodsVM.items[index].count == 0){
                                                                  goodsVM.items[index].isChecked = false;
                                                                  goodsVM.removeItem(goodsVM.items[index]);
                                                                }
                                                              });
                                                            },
                                                          ),
                                                        ),
                                                        Text(goodsVM.items[index].count.toString(), style: TextStyle(fontSize: 18),),
                                                        SizedBox(
                                                          height: 40,
                                                          width: 40,
                                                          child: FlatButton(
                                                            padding: EdgeInsets.only(left: -5),
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.circular(20)
                                                            ),
                                                            color: Colors.pink,
                                                            child: Icon(Icons.add),
                                                            onPressed: (){
                                                              setState(() {
                                                                goodsVM.items[index].count++;
                                                              });
                                                            },
                                                          ),
                                                        ),
                                                        Text("￥${goodsVM.items[index].price}", style: TextStyle(fontSize: 18),)
                                                      ],
                                                    )
                                                  ],
                                                )
                                            )
                                          ],
                                        )),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                ),
              ),
              Container(
                  alignment: Alignment.center,
                  color: Colors.grey[200],
                  height: 74,
                  child: Row(
                    children: [
                      FlatButton(
                        //splashColor和highlightColor为了消除掉按钮点击产生的特效
                        splashColor:Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: isSelectAll?Row(
                          children: [
                            Icon(Icons.check_circle_outline, color: Colors.pinkAccent,),
                            Container(
                              width: 50,
                                child: Text("全 选"))
                          ],
                        ):Row(
                          children: [
                            Icon(Icons.check_circle_outline),
                            Container(
                              width: 50,
                                child: Text("未全选"))
                          ],
                        ),
                        onPressed: (){
                          setState(() {
                            isSelectAll = !isSelectAll;
                          });
                          if(isSelectAll){
                            goodsVM.items.forEach((element){
                              element.isChecked = true;
                            });
                          }else{
                            goodsVM.items.forEach((element) {
                              element.isChecked = false;
                            });
                          }
                        },
                      ),
                      Container(
                        width: 180,
                        child: Text("总价合计：${getTrueItem(goodsVM.items)} ",
                          style: TextStyle(fontSize: 20, fontWeight:FontWeight.bold ),),
                      ),
                      Text("去计算(${goodsVM.items.where((element) => element.isChecked==true).length})", style: TextStyle(fontSize: 20,color: Colors.pinkAccent),),
                      IconButton(
                        icon: Icon(Icons.restore_from_trash, color: Colors.redAccent,),
                        onPressed: (){
                          return showAlertDialog(goodsVM.items);
                        },
                      )
                    ],
                  )
              )
            ],
          );
        }
      },
    );
  }

  //购物车的清空按钮
  showAlertDialog(List<HomeShowItem> items){
    //设置按钮
    Widget cancelButton = FlatButton(
      child: Text("清空"),
      onPressed: (){
        setState(() {
          items.removeRange(0, items.length);
        });
        Navigator.pop(context);
      },
    );

    Widget continueButton = FlatButton(
      child: Text("取消"),
      onPressed: (){
        Navigator.pop(context);
      },
    );

    //设置对话框
    AlertDialog alertDialog = AlertDialog(
      title: Text("清空购物车"),
      content: Text("是否要清空购物车？"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    //显示对话框
    showDialog(
        context: context,
      builder: (BuildContext context){
          return alertDialog;
      }
    );
  }
}

String getTrueItem(List<HomeShowItem> items){
  double price = 0;
  List<double> totalPrice = [];
  List<HomeShowItem>  isTrueItems = items.where((element) => element.isChecked == true).toList();
  if(isTrueItems.length == 0){
    return price.toString();
  }else{
    for(int i=0; i<isTrueItems.length; i++){
      price = double.parse(isTrueItems[i].price) * isTrueItems[i].count;
      totalPrice.add(price);
    }
    return totalPrice.reduce((value, element) => value + element).toStringAsFixed(2);
  }

}





