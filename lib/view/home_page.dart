import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:video_player_online/model/video_data.dart';
import 'package:video_player_online/view/widgets/vidoecard.dart';

import '../model/video_data_model.dart';

class ScreenHomePage extends StatefulWidget {
  ScreenHomePage({Key? key}) : super(key: key);

  @override
  State<ScreenHomePage> createState() => _ScreenHomePageState();
}

class _ScreenHomePageState extends State<ScreenHomePage> {
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Image.asset(
            "assets/youtube.png",
            fit: BoxFit.fitWidth,
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.cast)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.notifications_outlined)),
          IconButton(
            iconSize: 25,
            onPressed: () {},
            icon: const CircleAvatar(
              foregroundImage: AssetImage(
                "assets/User-Icon.png",
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
          child: NotificationListener<UserScrollNotification>(
            onNotification: (notification){
          //    log(notification.metrics.axisDirection.toString());
         // log(notification.direction.index.toString());

         if (notification.direction == ScrollDirection.reverse) {
           
         }
              log(scrollController.position.pixels.toString());
              return true;
          

            },
        child: ListView.builder(
          controller: scrollController,
          itemBuilder: (context, index) {
            final allvideo = videoDataModelFromJson(jsonEncode(videoData));
            return VideoCard(video: allvideo[index]);
          },
        ),
      )),
    );
  }
}
