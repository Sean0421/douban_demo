
import 'package:flutter/material.dart';

class SHMockEleme extends StatefulWidget {
  @override
  _SHMockElemeState createState() => _SHMockElemeState();
}

class _SHMockElemeState extends State<SHMockEleme> with SingleTickerProviderStateMixin{
  ScrollController _scrollController;
  TabController _tabController;
  List<String> _title = ["点餐", "评价","商家"];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _tabController = TabController(length: _title.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                backgroundColor: Colors.blueAccent,
                title: Text("复仇者联盟"),
                actions: [Row(
                  children: [
                    Icon(Icons.favorite_border),
                    Text("关注")
                  ],
                ),SizedBox(width: 20,)],
                expandedHeight: 250.0,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    children: [
                      Image.network(
                        'http://img.haote.com/upload/20180918/2018091815372344164.jpg',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 200,
                      ),
                      Positioned(
                        bottom: 0,
                        left: 20,
                        right: 20,
                        child: Card(
                          color: Colors.grey[200],
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))),
                          child: Container(
                            width: 400,
                            height: 200,
                            alignment: Alignment.center,
                            child: Text("联盟介绍",style: TextStyle(fontSize: 25),),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: MySliverPersistentHeader(
                    Scaffold(
                      body: TabBar(
                        controller: _tabController,
                        tabs: _title.map((e) => Text(e,style: TextStyle(fontSize: 26,color: Colors.black),)).toList(),
                      ),
                    )
                ),
              )
            ];
          },
          body: TabBarView(
            controller: _tabController,
            children: [
              Container(color: Colors.green,),
              Container(color: Colors.grey,),
              Container(color: Colors.yellow,),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
            ),
            alignment: Alignment.centerLeft,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton(
                  onPressed: (){
                    showModalBottomSheet(
                      //isScrollControlled:判断是半屏还是全屏
                        isScrollControlled: false,
                        //isDismissible:判断点击其他区域是否可以返回
                        isDismissible: true,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
                        ),
                        backgroundColor: Colors.blue,
                        context: context,
                        builder: (context){
                          return StatefulBuilder(
                            //为了区分，在构建builder的时候将setState方法命名为了setBottomSheetState
                            builder: (context1, setBottomSheetState){
                              return Container(
                                constraints: BoxConstraints(
                                    minHeight: 100,
                                    maxHeight: 300
                                ),
                                child: GestureDetector(
                                  child: Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
                                        ),
                                        alignment: Alignment.center,
                                        height: 50,
                                        child: Text("相关信息"),
                                      ),
                                      Expanded(
                                        child: ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: 40,
                                            itemBuilder: (context, index){
                                              return Container(
                                                alignment: Alignment.center,
                                                height: 30,
                                                child: Text("111"),
                                              );
                                            }),
                                      )
                                    ],
                                  ),
                                  onTap: (){
                                    //注意不是调用老页面的setState方法，而是调用builder的setBottomSheetState方法
                                    setBottomSheetState((){
                                    });
                                    Navigator.of(context).pop();
                                  },
                                ),
                              );
                            },
                          );
                        });
                  },
                  child: Text("查看评论")
                ),
              ],
            ),
          ),
        ),
      ],
    )
    ;
  }
}

class MySliverPersistentHeader extends SliverPersistentHeaderDelegate{
  Widget child;

  MySliverPersistentHeader(this.child);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 40;

  @override
  double get minExtent => 40;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}