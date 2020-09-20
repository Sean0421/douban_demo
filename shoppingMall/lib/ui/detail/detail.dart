import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoppingMall/core/extension/int_extension.dart';
import 'package:shoppingMall/core/model/home_show_item.dart';
import 'package:shoppingMall/ui/detail/detail_bottom_bar.dart';
import 'package:shoppingMall/ui/widget/shared/floating_button_location.dart';
import 'package:shoppingMall/ui/widget/swiper/flutter_swiper.dart';

class SHHomeDetail extends StatefulWidget {
  static String routeName = "/detail";

  @override
  _SHHomeDetailState createState() => _SHHomeDetailState();
}

class _SHHomeDetailState extends State<SHHomeDetail> with SingleTickerProviderStateMixin{
  TabController _tabController;
  List<String> _title = ["商品","参数","评论","推荐",];
  ScrollController _controller = ScrollController(initialScrollOffset: 0);
  int _currentInt = 0;
  bool isShowFloating = false;
  GlobalKey globalKeyOne = GlobalKey();
  GlobalKey globalKeyTwo = GlobalKey();
  GlobalKey globalKeyThree = GlobalKey();
  var oneY = 0.0;
  var twoY = 0.0;
  var threeY = 0.0;


  @override
  void initState() {
    super.initState();

    //想要知道子组件的具体位置等相关信息一定要在渲染完成之后才可以查询到
    //之后我们可以通过globalkey来拿到相关子组件的具体位置信息
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      RenderBox renderBox1 = globalKeyOne.currentContext.findRenderObject();
      var offset1 = renderBox1.localToGlobal(Offset.zero);
      oneY = offset1.dy;
      // print(oneY);

      RenderBox renderBox2 = globalKeyTwo.currentContext.findRenderObject();
      var offset2 = renderBox2.localToGlobal(Offset.zero);
      twoY = offset2.dy;
      // print(twoY);

      RenderBox renderBox3 = globalKeyThree.currentContext.findRenderObject();
      var offset3 = renderBox3.localToGlobal(Offset.zero);
      threeY = offset3.dy;
      // print(threeY);
    });

    _controller.addListener(() {
      // print(_controller.offset);
      if(_controller.offset < oneY-100){
        _tabController.animateTo(0);
      }
      if(twoY-100 > _controller.offset && _controller.offset >= oneY-100){
        _tabController.animateTo(1);
      }
      if(threeY-100 > _controller.offset && _controller.offset >= twoY-100){
        _tabController.animateTo(2);
      }
      if(_controller.offset >= threeY-120){
        _tabController.animateTo(3);
      }

      setState(() {
        isShowFloating = _controller.offset > 300;
      });
    });

    _tabController = TabController(length: _title.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final _items = ModalRoute.of(context).settings.arguments as HomeShowItem;

    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 50.px,
          child: TabBar(
            labelColor: Colors.yellow,
            indicatorColor: Colors.amber,
            unselectedLabelColor: Colors.black,
            controller: _tabController,
            tabs:_title.map((e) => Container(
                child: Container(
                  alignment: Alignment.center,
                  height: 30.px,
                    child: Text(e, style: TextStyle(fontSize: 20.px),))
            )).toList(),
            onTap: (int){
              switch(int){
                case 0:
                  _controller.animateTo(0, duration: Duration(seconds: 1), curve: Curves.ease);
                  break;
                case 1:
                  _controller.animateTo(oneY-100, duration: Duration(seconds: 1), curve: Curves.ease);
                  break;
                case 2:
                  _controller.animateTo(twoY-100, duration: Duration(seconds: 1), curve: Curves.ease);
                  break;
                case 3:
                  _controller.animateTo(threeY-100, duration: Duration(seconds: 1), curve: Curves.ease);
                  break;
              }
            },
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              height: 580.px,
              child: CustomScrollView(
                controller: _controller,
                slivers: [
                  SliverToBoxAdapter(
                    child: SHFlutterSwiper(),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      key: globalKeyOne,
                      alignment: Alignment.center,
                      height: 300,
                      width: double.infinity,
                      color: Colors.amber,
                      child: Text("参数展示区", style: TextStyle(fontSize: 30, color: Colors.black),),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      key: globalKeyTwo,
                      alignment: Alignment.center,
                      height: 300,
                      width: double.infinity,
                      color: Colors.yellowAccent,
                      child: Text("评论展示区", style: TextStyle(fontSize: 30, color: Colors.black),),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      key: globalKeyThree,
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 20,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 5,
                            childAspectRatio: 0.8,
                            crossAxisSpacing: 5
                          ),
                          itemBuilder: (context, index){
                          return Container(
                            padding: EdgeInsets.only(top: 10,left: 10,right: 10),
                            height: 70.px,
                              child: Column(
                                children: [
                                  Image.network(_items.image,height: 200,width: 200,),
                                  Text(_items.title,overflow: TextOverflow.ellipsis,),
                                ],
                              ));
                          }
                      ),
                    ),
                  )
                ]
              ),
            ),
            SHDetailBottomBar(_items),
          ],
        ),
      ),
      // floatingActionButtonLocation: CustomFloatingActionButtonLocation(FloatingActionButtonLocation.endFloat,0,-60),
      //当我们需要微调floatingActionButton的位置时，有两种方法：1.使用CustomFloatingActionButtonLocation
      //2.使用SizeBox来做调整
      //第一种方法的弊端，频繁的刷新(暂未解决)
      //第二种方法会有一个Bug,就是当点击其他区域时也会触发回到顶部，可以加Column来进行调整就可以消除Bug了
      floatingActionButton: isShowFloating ?SizedBox(
        height: 120,
        width: 60,
        child: Column(
          children: [
            FloatingActionButton(
              backgroundColor: Colors.green,
              child: Icon(Icons.arrow_upward),
              onPressed: (){
                _controller.animateTo(0, duration: Duration(seconds: 1), curve: Curves.ease);
              },
            ),
          ],
        ),
      ):null,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    _controller.dispose();
    super.dispose();
  }
}
