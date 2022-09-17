// To parse this JSON data, do
//
//     final videoDataModel = videoDataModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<VideoDataModel> videoDataModelFromJson(String str) => List<VideoDataModel>.from(json.decode(str).map((x) => VideoDataModel.fromJson(x)));

String videoDataModelToJson(List<VideoDataModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VideoDataModel {
    VideoDataModel({
        required this.id,
        required this.title,
        required this.videoUrl,
        required this.coverPicture,
    });

    int id;
    String title;
    String videoUrl;
    String coverPicture;

    factory VideoDataModel.fromJson(Map<String, dynamic> json) => VideoDataModel(
        id: json["id"],
        title: json["title"],
        videoUrl: json["videoUrl"],
        coverPicture: json["coverPicture"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "videoUrl": videoUrl,
        "coverPicture": coverPicture,
    };
}
