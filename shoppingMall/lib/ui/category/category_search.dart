import 'dart:async';

import 'package:flutter/material.dart';

class SHTextScreen extends StatefulWidget {
  final String _text;

  SHTextScreen(this._text);

  @override
  _SHTextScreenState createState() => _SHTextScreenState();
}

class _SHTextScreenState extends State<SHTextScreen> {
  Timer _countdownTimer;
  String _codeCountdownStr = "获取验证码";
  int _countdownNum = 59;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("搜索结果"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("${widget._text}页面", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
            Container(
              width: 150,
              child: ExpansionTile(
                title: Text("江苏",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                subtitle: Text("苏州"),
                children: [
                  Text("湖北"),
                  Text("上海"),
                  Text("广州"),
                  Text("安徽"),
                  Text("江西"),
                ],
              ),
            ),
            Text(timeTransition()),
            //获取验证码倒计时的Widget
            // GestureDetector(
            //   child: Card(
            //       elevation: 5,
            //       child: Text(_codeCountdownStr)),
            //   onTap: (){
            //     reGetCountdown();
            //   },
            // ),
          ],
        ),
      ),

    );
  }

  String timeTransition(){
    //时间戳是指格林威治时间1970年01月01日00时00分00秒(北京时间1970年01月01日08时00分00秒)起至现在的总毫秒数
    //正确的时间戳为13位，但是有时候后台会传10位，是因为我们一般不考虑后边三位的毫秒数，
    //   但是计算需要，如果后台传10位的话，就需要在添加三位，如果后台传13位，就不需要操作
    String time = "1539204958323";
    DateTime createTime = DateTime.fromMillisecondsSinceEpoch(int.parse(time));
    // print(createTime);
    String showTime = createTime.toLocal().toString().substring(0,19);
    return showTime;
  }

  //实现短信获取验证码倒计时功能
  void reGetCountdown(){
    setState(() {
      if(_countdownTimer != null){
        return null;
      }else{
        _codeCountdownStr = "(${_countdownNum--})重新获取";
        _countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
          setState(() {
            if(_countdownNum > 0){
              _codeCountdownStr = "(${_countdownNum--})重新获取";
            }else{
              _codeCountdownStr = "获取验证码";
              _countdownNum = 59;
              _countdownTimer.cancel();
              // _countdownTimer = null;
            }
          });
        });
      }
    });
  }

  @override
  void dispose() {
    // _countdownTimer.cancel();
    // _countdownTimer = null;
    super.dispose();
  }
}