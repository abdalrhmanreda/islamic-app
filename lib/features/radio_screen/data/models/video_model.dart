class ReciterModel {
  final int id;
  final String reciterName;
  final List<VideoModel> videos;

  ReciterModel({
    required this.id,
    required this.reciterName,
    required this.videos,
  });

  factory ReciterModel.fromJson(Map<String, dynamic> json) {
    var videoList = json['videos'] as List;
    List<VideoModel> videos =
        videoList.map((i) => VideoModel.fromJson(i)).toList();

    return ReciterModel(
      id: json['id'],
      reciterName: json['reciter_name'],
      videos: videos,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'reciter_name': reciterName,
      'videos': videos.map((video) => video.toJson()).toList(),
    };
  }
}

class VideoModel {
  final int id;
  final int videoType;
  final String videoUrl;
  final String videoThumbUrl;

  VideoModel({
    required this.id,
    required this.videoType,
    required this.videoUrl,
    required this.videoThumbUrl,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      id: json['id'],
      videoType: json['video_type'],
      videoUrl: json['video_url'],
      videoThumbUrl: json['video_thumb_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'video_type': videoType,
      'video_url': videoUrl,
      'video_thumb_url': videoThumbUrl,
    };
  }
}
