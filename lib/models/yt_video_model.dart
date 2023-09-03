class YtVideoModel{
  String title;
  String description;
  String url;
  String thumbnailUrl;
  String channelName;

  YtVideoModel({required this.title, required this.description, required this.url, required this.thumbnailUrl, required this.channelName});

  //factory constructor to create objects from json
  factory YtVideoModel.fromJson(Map<String, dynamic> json){
    return YtVideoModel(
      title: json['snippet']['title'],
      description: json['snippet']['description'],
      url: "https://www.youtube.com/watch?v=${json['id']['videoId']}",
      thumbnailUrl: json['snippet']['thumbnails']['medium']['url'],
      channelName: json['snippet']['channelTitle']
    );
  }
}