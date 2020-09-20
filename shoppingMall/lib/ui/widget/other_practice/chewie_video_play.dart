
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SHChewieVideoPlay extends StatefulWidget {
  @override
  _SHChewieVideoPlayState createState() => _SHChewieVideoPlayState();
}

class _SHChewieVideoPlayState extends State<SHChewieVideoPlay> {
  VideoPlayerController _videoPlayerController;
  ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network("http://vfx.mtime.cn/Video/2019/02/04/mp4/190204084208765161.mp4");
    _videoPlayerController.initialize().then((value) {
      setState(() {
      });
    });
    _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController,
        autoInitialize: false,
        allowedScreenSleep: true,
        allowFullScreen: true,
        aspectRatio: 3/2,
        autoPlay: false,
        // overlay: Container(height: 100,width: 100,color: Colors.red,),
        //   placeholder: Container(height: 100,width: 100,color: Colors.red,),
        looping: false
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ChewieVideoPlay"),
      ),
      body: Center(
        child: Chewie(
          controller: _chewieController,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }
}

//使用video_play的widget
// Container(
//   height: 300,
//   child: _videoPlayerController.value.initialized
//       ?AspectRatio(
//     aspectRatio: _videoPlayerController.value.aspectRatio,
//         child: VideoPlayer(_videoPlayerController),
//   ):Container()
// ),

//控制video_play的pause/play按钮
// floatingActionButton: FloatingActionButton(
//   onPressed: () {
//     setState(() {
//       _videoPlayerController.value.isPlaying
//           ? _videoPlayerController.pause()
//           : _videoPlayerController.play();
//     });
//   },
//   child: Icon(
//     _videoPlayerController.value.isPlaying ? Icons.pause : Icons.play_arrow,
//   ),
// ),
