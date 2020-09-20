
import 'dart:math';

import 'package:flutter/material.dart';

class SHCategoryContent extends StatefulWidget {
  @override
  _SHCategoryContentState createState() => _SHCategoryContentState();
}

class _SHCategoryContentState extends State<SHCategoryContent> with SingleTickerProviderStateMixin{
  TabController _tabController;
  int _currentIndex = 0;
  List<String> _title = ["正在流行","上衣","裤子","裙子","内衣","女鞋","男友","包包","运动","配饰","美妆","个护","家居","百货","母婴","食品"];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _title.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: [
        Flexible(
          flex: 1,
          child: Container(
            color: Colors.grey[300],
            child: ListView.builder(
              itemCount: _title.length,
                itemBuilder: (context, index){
                  return GestureDetector(
                    child: _currentIndex == index?Container(
                      decoration: BoxDecoration(
                        border: Border(
                          left: BorderSide(
                            width: 3,
                            color: Colors.red
                          )
                        )
                      ),
                      alignment: Alignment.center,
                      height: 50,
                      width: double.infinity,
                      child: Text(_title[index],style: TextStyle(fontSize: 20, color: Colors.red),),
                    ):Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: double.infinity,
                      child: Text(_title[index]),
                    ),
                    onTap: (){
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  );
                }
            ),
          ),
        ),
        Flexible(
          flex: 3,
          child: Container(
            padding: EdgeInsets.only(top: 10, left: 10,right: 10),
            color: Colors.white,
            child: GridView.builder(
              itemCount: 30,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  childAspectRatio: 1.5,
                  crossAxisSpacing: 8
                ),
                itemBuilder: (context, index){
                  return Container(
                    alignment: Alignment.center,
                    height: 100,
                    color: Color.fromARGB(255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256)),
                    child: Text(_title[_currentIndex]),
                  );
                }),
          ),
        )
      ],
    );
  }
}
