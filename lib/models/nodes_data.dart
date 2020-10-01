import 'package:flutter_app_test1/models/photo_gallery.dart';

class NodesData {
  PhotoGallary gallary;

  NodesData({this.gallary});

  factory NodesData.fromJson(Map<String, dynamic> json) {
    return NodesData(
      gallary: PhotoGallary.fromJson(json['node']),
    );
  }
}
