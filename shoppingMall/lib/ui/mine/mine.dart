
import 'package:flutter/material.dart';
import 'package:shoppingMall/ui/widget/other_practice/add_cart_parabola.dart';
import 'package:shoppingMall/ui/widget/other_practice/animated_container.dart';
import 'package:shoppingMall/ui/widget/other_practice/chewie_video_play.dart';
import 'package:shoppingMall/ui/widget/other_practice/city_selection.dart';
import 'package:shoppingMall/ui/widget/other_practice/mock_eleme.dart';
import 'package:shoppingMall/ui/widget/other_practice/animated_align.dart';
import 'package:shoppingMall/ui/widget/other_practice/overlay.dart';

class SHMineScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          title: Center(child: Text("Sean购物商场")),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 850,
            child: Column(
              children: [
                Container(
                  color: Colors.pink,
                  height: 150,
                  child: Row(
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 20),
                          alignment: Alignment.center,
                          width:100,
                          height: 100,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: Colors.white)
                          ),
                          child: Icon(Icons.person, size: 80,color: Colors.grey,)),
                      SizedBox(width: 10,),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("登录/注册",style: TextStyle(color: Colors.white),),
                            Row(
                              children: [
                                Icon(Icons.phone_android,color: Colors.white,),
                                Text("暂无绑定的手机号",style: TextStyle(color: Colors.white),)
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: 70,),
                      Icon(Icons.arrow_forward_ios,color: Colors.white,)
                    ],
                  ),
                ),
                Container(
                  height: 100,
                  child: Row(
                    children: [
                      Expanded(child: container("0.00元", "我的余额"),),
                      Expanded(child: container("0个", "我的优惠"),),
                      Expanded(child: container("0分", "我的积分"),),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 15,
                              color: Colors.grey[200]
                          )
                      )
                  ),
                  child: Column(
                    children: [
                      infoList(Icons.assignment, "我的消息", Colors.black),
                      infoList(Icons.assignment_late, "积分商场", Colors.orange),
                      infoList(Icons.flare, "会员卡",Colors.yellow),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      children: [
                        infoList(Icons.add_shopping_cart, "我的购物车", Colors.pink[200]),
                        GestureDetector(
                          child: infoList(Icons.apps, "MockEleme", Colors.pink[200]),
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SHMockEleme()
                            ));
                          },
                        ),
                        GestureDetector(
                          child: infoList(Icons.map, "点击前往城市区域选择", Colors.purple),
                          onTap: (){
                            Navigator.push(context, PageRouteBuilder(
                                transitionDuration: Duration(seconds: 1),
                                pageBuilder: (context, animation1, animation2){
                                  return FadeTransition(
                                    opacity: animation1,
                                    child: SHCitySelection(),
                                  );
                                }
                            ));
                          },
                        ),
                        GestureDetector(
                          child: infoList(Icons.play_circle_outline, "点击播放视频", Colors.redAccent),
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SHChewieVideoPlay()
                            ));
                          },
                        ),
                        GestureDetector(
                          child: infoList(Icons.bookmark_border, "AnimatedAlign", Colors.pinkAccent),
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SHShowModalBottomSheet()
                            ));
                          },
                        ),
                        GestureDetector(
                          child: infoList(Icons.image, "Overlay", Colors.cyan),
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SHOverlay()
                            ));
                          },
                        ),
                        GestureDetector(
                          child: infoList(Icons.shopping_cart, "AddCatyParabola", Colors.blueAccent),
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SHAddCatyParabola()
                            ));
                          },
                        ),
                        GestureDetector(
                          child: infoList(Icons.assignment_late, "上滑或下滑显示/隐藏搜索栏", Colors.blueGrey),
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SHAnimatedContainer()
                            ));
                          },
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget container(String num, String info){
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 15,
            color: Colors.grey[200]
          ),
          right: BorderSide(
            width: 1,
            color: Colors.grey
          )
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(num),
          Text(info)
        ],
      ),
    );
  }

  Widget infoList(IconData icon, String content, Color color){
    return Container(
      height: 50,
      child: Row(
        children: [
          SizedBox(width: 10,),
          Icon(icon,color: color,size: 30,),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: Colors.grey[200]
                  )
                )
              ),
              child: Text(content,style: TextStyle(fontSize: 18),),
            ),
          )
        ],
      ),
    );
  }
}



