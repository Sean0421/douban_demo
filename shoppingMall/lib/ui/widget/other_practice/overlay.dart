
import 'package:flutter/material.dart';

class SHOverlay extends StatefulWidget {
  @override
  _SHOverlayState createState() => _SHOverlayState();
}

class _SHOverlayState extends State<SHOverlay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Overlay"),
      ),
      body: Container(
        color: Colors.cyan,
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.fiber_smart_record),
          onPressed: () => _showOverlayDemo2(context)
      ),
    );
  }
  
  _showOverlayDemo1(BuildContext context)async {
    OverlayState overlayState = Overlay.of(context);
    OverlayEntry overlayEntry = OverlayEntry(
        builder: (context){
          return Center(
            child: Container(
              height: 100,
              width: 100,
              color: Colors.cyan,
            ),
          );
        }
    );
    overlayState.insert(overlayEntry);

    await Future.delayed(Duration(seconds: 2),(){
      overlayEntry.remove();
    });
  }

  _showOverlayDemo2(BuildContext context)async {
    Color color = Colors.green;

    OverlayState overlayState = Overlay.of(context);
    OverlayEntry overlayEntry = OverlayEntry(
        builder: (context){
          return Center(
            child: Container(
              width: 100,
              height: 100,
              color: color,
            ),
          );
        }
    );
    overlayState.insert(overlayEntry);

    await Future.delayed(Duration(seconds: 1), (){
      color = Colors.red;
      //如果你想改变叠加层的状态，需要在状态改变后用overlayEntry.markNeedsBuild()它将在下一帧重新build
      //而不是setState()
      overlayEntry.markNeedsBuild();
    });
    await Future.delayed(Duration(seconds: 1), (){
      overlayEntry.remove();
    });
  }
}
