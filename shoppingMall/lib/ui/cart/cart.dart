
import 'package:flutter/material.dart';
import 'package:shoppingMall/ui/cart/cart_items.dart';

class SHCartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("购物车")),
      ),
      body: SHCartItems(),
    );
  }
}
