class VideoData {
  final String title;
  final String channel;
  final String url;

  VideoData({required this.title, required this.channel, required this.url});
}

class AppVideos {
  static final List<VideoData> VIDEOS = [
    VideoData(
      title: "sidoka",
      channel: "sidoka",
      url: "https://www.youtube.com/watch?v=tGSAJi322seU",
    ),
    // Adicione mais vídeos aqui no futuro
  ];
}
