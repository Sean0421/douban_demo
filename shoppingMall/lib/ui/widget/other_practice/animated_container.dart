
import 'package:flutter/material.dart';

class SHAnimatedContainer extends StatefulWidget {
  @override
  _SHAnimatedContainerState createState() => _SHAnimatedContainerState();
}

class _SHAnimatedContainerState extends State<SHAnimatedContainer> {
  TextEditingController searchTextEditController;
  bool isShowContent = false;
  ScrollController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedContainer"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        controller: _controller,
        child: Listener(
          onPointerMove: (event){
            // print(event.delta);
            setState(() {
              if(event.delta.dy >0){
                isShowContent = true;
              }else{
                isShowContent = false;
              }
            });
          },
          child: Container(
            height: 2000,
            color: Colors.orangeAccent,
            child: Column(
              children: [
                AnimatedContainer(
                  alignment: Alignment.center,
                      duration: Duration(seconds: 1),
                      width: double.infinity,
                      height: isShowContent?50:0,
                      color: Colors.white,
                      curve: Curves.ease,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    height: 40,
                    width: 350,
                    child: TextField(
                      controller: searchTextEditController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        border: InputBorder.none,
                      ),
                    ),
                  )
                    ),
                Container(
                  height: 150,
                  color: Colors.blue,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
