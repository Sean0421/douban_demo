
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shoppingMall/core/model/city_model.dart';
import 'package:shoppingMall/core/service/json_city_parse.dart';
import 'package:shoppingMall/core/extension/int_extension.dart';

class SHCitySelection extends StatefulWidget {
  @override
  _SHCitySelectionState createState() => _SHCitySelectionState();
}

class _SHCitySelectionState extends State<SHCitySelection> {
  ScrollController _controller = ScrollController(initialScrollOffset: 0);
  List<SHCityModel> _cityCode = [];

  @override
  void initState() {
    super.initState();
    SHJsonCityParse.getCityData().then((value) {
      setState(() {
        _cityCode = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.blue
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: (){
              Navigator.of(context).pop();
            },
          ),
          title: Text("城市地区选择"),
        ),
        body: Stack(
          children: [
            ListView.builder(
                controller: _controller,
                shrinkWrap: true,
                itemCount: _cityCode.length,
                itemBuilder: (context, index){
                  return Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(5.px),
                          height: 50.px,
                          alignment: Alignment.centerLeft,
                          child: Text("${_cityCode[index].title}",style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: _cityCode[index].lists.length,
                            itemBuilder: (context, num){
                              return Container(
                                alignment: Alignment.centerLeft,
                                height: 50.px,
                                padding: EdgeInsets.symmetric(horizontal: 15.px),
                                child: Text("${_cityCode[index].lists[num]}", style: TextStyle(fontSize: 20),),
                              );
                            }
                        )
                      ],
                    ),
                  );
                }
            ),
            Positioned(
              right: 5.px,
              top: 40.px,
              width: 50.px,
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _cityCode.length,
                  itemBuilder: (context, index){
                    return GestureDetector(
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Text("${_cityCode[index].title}",style: TextStyle(fontSize: 20),)
                          ],
                        ),
                      ),
                      onTap: (){
                        var height = index * 50;
                        for(int i =0; i < index; i++){
                          height += _cityCode[i].lists.length * 50;
                        }
                        _controller.animateTo(height.px, duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                      },
                    );
                  }
              ),
            )
          ],
        ),
      ),
    );
  }

}