import 'package:fittrix/viewModels/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final mainController = MainController.to;

  List<String> video = ["assets/video/ad_video1.mp4", "assets/video/ad_video2.mp4"];
  int initVideo = 0;
  bool isFinish = false;

  @override
  void initState() {
    super.initState();
    videoInit();
  }

  Future<void> videoInit() async {
    isFinish = false;
    mainController.videoController = VideoPlayerController.asset(video[initVideo])
      ..initialize().then((value) {
        setState(() { });
      });
    mainController.videoController?.addListener(() {
      if(mainController.videoController!.value.isCompleted) {
        isFinish = true;
        initVideo = initVideo == 1 ? 0 : 1;
      }
      if(isFinish) {
        videoInit();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        body: Center(
          child: mainController.videoController?.value.isInitialized ?? false
          ? AspectRatio(
            aspectRatio: mainController.videoController!.value.aspectRatio,
            child: VideoPlayer(mainController.videoController!),
          ) : Container()
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              mainController.videoController?.value.isPlaying ?? false
                  ? mainController.videoController?.pause()
                  : mainController.videoController?.play();
            });
          },
          child: Icon(
            mainController.videoController?.value.isPlaying ?? false ? Icons.pause : Icons.play_arrow,
          ),
        ),
      ),
    );
  }
}
