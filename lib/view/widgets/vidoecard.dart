
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player_online/model/video_data_model.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VideoCard extends StatefulWidget {
  final VideoDataModel video;

   const VideoCard({Key? key, required this.video}) : super(key: key);

  @override
  State<VideoCard> createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  VideoPlayerController? _videoPlayerController;

  @override
  void initState() {
    super.initState();
    
    _videoPlayerController =
        VideoPlayerController.network(widget.video.videoUrl.toString());
    _videoPlayerController!.addListener(() {
      setState(() {
 
      });
    });
 
    _videoPlayerController!.setLooping(true);


    _videoPlayerController!.initialize().then((value) {
      setState(() {});
    });
  }




  @override
  void deactivate() {
    _videoPlayerController!.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _videoPlayerController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return        VisibilityDetector(
          key: const Key("unique key"),
          onVisibilityChanged: (info) {
            if (info.visibleFraction == 0) {
            
             setState(() {
                _videoPlayerController!.pause();
   
             });
            } else {
            setState(() {

              _videoPlayerController!.play(); 
             
         
            });

            }
          },child: videoplayer());
  }

  Widget videoplayer() {

      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: _videoPlayerController!.value.isInitialized
            ? Column(
                children: [
                  Text(widget.video.title),
                  AspectRatio(
                    aspectRatio: _videoPlayerController!.value.aspectRatio,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: VideoPlayer(
                        
                        _videoPlayerController!),
                    ),
                  ),
                ],
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.black,
                  child: Center(
                      child:
                          Image.network(widget.video.coverPicture.toString())),
                ),
              ),
      );
    
  }
}
