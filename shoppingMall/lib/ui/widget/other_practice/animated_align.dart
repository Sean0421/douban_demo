
import 'package:flutter/material.dart';

class SHShowModalBottomSheet extends StatefulWidget {
  @override
  _SHShowModalBottomSheetState createState() => _SHShowModalBottomSheetState();
}

class _SHShowModalBottomSheetState extends State<SHShowModalBottomSheet> {
  var _alignment = Alignment(-0.5,-0.5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.lightBlue,
        child: AnimatedAlign(
          alignment: _alignment,
          curve: Curves.decelerate,
          duration: Duration(seconds: 2),
          child: IconButton(
            icon: Icon(Icons.book, color: Colors.red,size: 30,),
            onPressed: (){
              setState(() {
                _alignment = Alignment.bottomRight;
              });
            },
          ),
          onEnd: (){},
        ),
      ),
    );
  }
}

//未使用
// class _MyClipper extends CustomClipper<RRect>{
//   @override
//   RRect getClip(Size size) {
//     return RRect.fromLTRBR(20, 0, 20, 0, Radius.circular(20));
//   }
//
//   @override
//   bool shouldReclip(CustomClipper<RRect> oldClipper) {
//     return true;
//   }
// }
