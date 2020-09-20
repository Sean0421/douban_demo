
import 'package:add_cart_parabola/add_cart_parabola.dart';
import 'package:flutter/material.dart';

class SHAddCatyParabola extends StatefulWidget {
  @override
  _SHAddCatyParabolaState createState() => _SHAddCatyParabolaState();
}

class _SHAddCatyParabolaState extends State<SHAddCatyParabola> {
  int _count = 0;
  GlobalKey floatKey = GlobalKey();
  GlobalKey rootKey = GlobalKey();
  Offset floatOffset;
  Offset temp;


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      RenderBox renderBox = floatKey.currentContext.findRenderObject();
      floatOffset = renderBox.localToGlobal(Offset.zero);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AddCatyParabola"),
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        key: rootKey,
        color: Colors.white,
        child: ListView.builder(
          itemCount: 30,
          itemBuilder: (context, index){
            return GestureDetector(
              onPanDown: (details){
                temp = Offset(details.globalPosition.dx, details.globalPosition.dy);
                //显示当前点击地方的坐标
                // print(temp);
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                height: 40,
                child: Text("item $index"),
              ),
              onTap: (){
                Function callback;
                setState(() {
                  _count++;
                  OverlayEntry entry = OverlayEntry(
                    builder: (context){
                      return ParabolaAnimateWidget(
                        /// root key：根widget key， 主要用于定位
                        /// temp:点击坐标，开始位置。floatOffset 结束坐标
                        ///Icon：传入想弹出的widget
                        ///call back: 会回传一个动画执行状态
                        ///duration： 动画时间 可选，默认1秒
                          rootKey,
                          temp,
                          floatOffset,
                          Icon(Icons.add,color: Colors.blueAccent,size: 40,),
                          callback,
                          duration: 1000,
                      );
                    }
                  );
                  callback = (status){
                    if(status == AnimationStatus.completed){
                      entry.remove();
                    }
                  };
                  OverlayState overlayState = Overlay.of(context);
                  overlayState.insert(entry);
                });
              },
            );
          },
        ),
      ),
      floatingActionButton: SizedBox(
        width: 70,
        height: 100,
        child: Stack(
          children: [FloatingActionButton(
            backgroundColor: Colors.blueAccent,
            tooltip: "+++++++",
            key: floatKey,
            child: Icon(Icons.add_shopping_cart,color: Colors.white,),
            onPressed: (){},
          ),
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                alignment: Alignment.center,
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)
                ),
                child: Text("$_count",style: TextStyle(fontSize: 15,color: Colors.black),),
              ),
            ),
          ]
        ),
      ),
    );
  }

}
