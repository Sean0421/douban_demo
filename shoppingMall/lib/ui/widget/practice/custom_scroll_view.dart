
import 'package:flutter/material.dart';

class MyCustomScrollView extends StatefulWidget {
  @override
  _MyCustomScrollViewState createState() => _MyCustomScrollViewState();
}

class _MyCustomScrollViewState extends State<MyCustomScrollView> with SingleTickerProviderStateMixin{
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            backgroundColor: Colors.redAccent,
            expandedHeight: 60,
            actions: <Widget>[
              IconButton(icon: Icon(Icons.arrow_back),onPressed: (){},),
              SizedBox(width: 300,),
              IconButton(icon: Icon(Icons.add),onPressed: (){},)
            ],
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 300,
              color: Colors.blue,
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: MySliverPersistentHeader(
                Container(
                  height: 50,
                  color: Colors.red,
                  child: TabBar(
                    indicatorWeight: 5,
                    indicatorColor: Colors.green,
                    controller: _tabController,
                    onTap: (value){
                      print(value);
                    },
                    tabs: <Widget>[
                      Text("1"),
                      Text("2"),
                      Text("3"),
                    ],
                  ),
                )
            ),
          ),
          SliverFillRemaining(
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                Container(height: double.infinity, color: Colors.amber,child: Text("234234234"),),
                Container(height: double.infinity, color: Colors.blue,),
                Container(height: double.infinity, color: Colors.purple,),
              ],
            ),
          )
        ],
      ),
    );
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
  double get maxExtent => 50;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}