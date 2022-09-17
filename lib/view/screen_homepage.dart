import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:video_player_online/model/video_data.dart';
import 'package:video_player_online/model/video_data_model.dart';
import 'package:video_player_online/view/widgets/custom_sliver_appbar.dart';
import 'package:video_player_online/view/widgets/vidoecard.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: CustomScrollView(
        slivers: [
          const CustomSliverAppBar(),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              
        
              
              (context, index) {
               
                 final allvideo = videoDataModelFromJson(jsonEncode(videoData));
   

                return VideoCard(video :allvideo[index]);
                
              },
              childCount: videoData.length
            ),
          ),
        ],
      ),
    );
  }
}
