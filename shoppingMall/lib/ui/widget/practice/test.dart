
import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shoppingMall/core/model/home_show_item.dart';
import 'package:shoppingMall/core/service/home_request.dart';
import 'package:shoppingMall/ui/home/home_build_items.dart';
import 'package:shoppingMall/ui/widget/practice/custom_scroll_view.dart';
import 'package:shoppingMall/ui/widget/swiper/flutter_swiper.dart';
import 'package:shoppingMall/core/extension/int_extension.dart';


class SHHomeScreen extends StatefulWidget {
  @override
  _SHHomeScreenState createState() => _SHHomeScreenState();
}

class _SHHomeScreenState extends State<SHHomeScreen> with SingleTickerProviderStateMixin{
  TabController _tabController;
  ScrollController _controller = ScrollController(initialScrollOffset: 0);
  PageController  _pageController;
  int _currentIndex = 0;
  int page = 1;
  bool isLoading = false;
  List<HomeShowItem> _items1 = [];
  List<HomeShowItem> _items2 = [];
  List<HomeShowItem> _items3 = [];

  List<String> _list = ["pop", "new", "sell"];
  List<String> _headTitle = ["流行", "新款", "精选"];

  bool _isShowFloatingButton = false;

  //通过网络请求时的方法
  getData(type, page) async {
    HomeRequest.requireHomeShowItem(type, page).then((value){
      if(type == _list[0]){
        _items1.addAll(value);
      }
      if(type == _list[1]){
        _items2.addAll(value);
      }
      if(type == _list[2]){
        _items3.addAll(value);
      }
    });
  }


  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _headTitle.length, vsync: this);
    _pageController = PageController();

    getData(_list[0], page);
    getData(_list[1], page);
    getData(_list[2], page);

    _controller.addListener(() {
      setState(() {
        _isShowFloatingButton = _controller.offset >= 500;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      body: RefreshIndicator(
        onRefresh: (){
          return Future.delayed(Duration(seconds: 1), (){
            _items1.clear();
            _items2.clear();
            _items3.clear();
            getData(_list[0], page);
            getData(_list[1], page);
            getData(_list[2], page);
          });
        },
        child: CustomScrollView(
          controller: _controller,
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Column(
                children: <Widget>[
                  SHFlutterSwiper(),
                  buildRecommend(),
                  buildFeature()
                ],
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: MySliverPersistentHeader(
                  Container(
                    height: 50,
                    color: Colors.white,
                    child: TabBar(
                      onTap: (value){
                        _pageController.animateToPage(value, duration: Duration(milliseconds: 500), curve: Curves.ease);
                      },
                      controller: _tabController,
                      tabs: _headTitle.map((e) => Container(child: Text(e,style: TextStyle(fontSize: 25, color: Colors.black),),)).toList(),
                    ),
                  )
              ),
            ),
            SliverFillRemaining(
              //NotificationListener可以根据加载后的数据更新当前的maxScrollExtent和pixels
              child: NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification notification){
                  // print(notification.metrics.maxScrollExtent);
                  // print(notification.metrics.pixels);
                  if(!isLoading && notification.metrics.maxScrollExtent <= notification.metrics.pixels +150){
                    setState(() {
                      isLoading = true;
                    });
                    Future.delayed(Duration(seconds: 1), (){
                      getData(_list[_currentIndex], page++);
                      setState(() {
                        isLoading = false;
                      });
                    });
                  }
                  return true;
                },
                child: PageView(
                  allowImplicitScrolling: false,
                  controller: _pageController,
                  children: [
                    SHHomeBuildItems(_items1),
                    SHHomeBuildItems(_items2),
                    SHHomeBuildItems(_items3),
                  ],
                  onPageChanged: (int){
                    _tabController.animateTo(int);
                    setState(() {
                      _currentIndex = int;
                    });
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child:  isLoading?CircularProgressIndicator(backgroundColor: Colors.green,):Container(),
            )
          ],
        ),
      ),
      floatingActionButton: _isShowFloatingButton ? FloatingActionButton(
        child: Icon(Icons.arrow_upward),
        onPressed: () {
          _controller.animateTo(0, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
        },
      ): null,
    );
  }

  Widget buildRecommend (){
    return Container(
      height: 150.px,
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  width: 5.px,
                  color: Colors.grey[300]
              )
          )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          buildRecommendItem("https://s10.mogucdn.com/mlcdn/c45406/180913_036dli57aah85cb82l1jj722g887g_225x225.png", "十点抢券"),
          buildRecommendItem("https://s10.mogucdn.com/mlcdn/c45406/180913_25e804lk773hdk695c60cai492111_225x225.png", "好物特卖"),
          buildRecommendItem("https://s10.mogucdn.com/mlcdn/c45406/180913_387kgl3j21ff29lh04181iek48a6h_225x225.png", "内购福利"),
          buildRecommendItem("https://s10.mogucdn.com/mlcdn/c45406/180913_8d4e5adi8llg7c47lgh2291akiec7_225x225.png", "初秋上新"),
        ],
      ),
    );
  }

  Widget buildRecommendItem (String imgUrl, String title){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.network(imgUrl, height: 80.px, width: 80.px),
        // CachedNetworkImage(
        //   height: 80.px,
        //   width: 80.px,
        //   imageUrl: imgUrl,
        //   placeholder: (context, url) => Image.asset("assets/image/004.jpeg"),
        //   errorWidget: (context, url, error) => Image.asset("assets/image/003.jpeg"),
        // ),
        Text(title)
      ],
    );
  }

  Widget buildFeature(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.px),
      width: double.infinity,
      height: 300.px,
      child: Image.asset("assets/image/001.jpg", fit: BoxFit.fill,),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
    _controller.dispose();
    _tabController.dispose();
  }

}



