
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shoppingMall/core/model/home_show_item.dart';
import 'package:shoppingMall/core/extension/int_extension.dart';
import 'package:shoppingMall/ui/detail/detail.dart';

// ignore: must_be_immutable
class SHHomeBuildItems extends StatefulWidget {
  List<HomeShowItem> _items;

  SHHomeBuildItems(this._items);

  @override
  _SHHomeBuildItemsState createState() => _SHHomeBuildItemsState();
}

class _SHHomeBuildItemsState extends State<SHHomeBuildItems> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GridView.builder(
        itemCount: widget._items.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.6
        ),
        itemBuilder: (context, index){
          return GestureDetector(
            child: Container(
              child: Column(
                children: [
                  // CachedNetworkImage(
                  //   fit: BoxFit.cover,
                  //   imageUrl: widget._items[index].image,
                  //   placeholder: (context, url) => Image.asset("assets/image/004.jpeg"),
                  //   errorWidget: (context, url, error) => Image.asset("assets/image/003.jpeg"),
                  // ),
                  Image.network(widget._items[index].image, fit: BoxFit.cover,),
                  Text(index.toString())
                ],
              ),
            ),
            onTap: (){
              Navigator.of(context).pushNamed(SHHomeDetail.routeName, arguments: widget._items[index]);
            },
          );
        }
    );
  }
}
