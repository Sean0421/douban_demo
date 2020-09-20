import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shoppingMall/core/model/home_show_item.dart';

class SHGoodsViewModel with ChangeNotifier{
  List<HomeShowItem> _items = [];

  
  //点击事件的对象也要用Consumer方法来获取当前viewmodel的方法，不然则无效
  void addItem(HomeShowItem item){
    if(_items.indexOf(item) == -1){
      _items.add(item);
    }else{
      return null;
    }
    notifyListeners();
  }

  void removeItem(HomeShowItem item){
    _items.remove(item);
    notifyListeners();
  }

  List<HomeShowItem> get items {
    return _items;
  }
}