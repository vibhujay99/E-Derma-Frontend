import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:e_derma/global/api_keys.dart';
import 'package:e_derma/models/yt_video_model.dart';


class YtApiService{

  //list of video objects
  final List<YtVideoModel> _videos = [];

  //send a request to yt api and get search results as json
  Future<List<YtVideoModel>> sendRequest(String query) async{

    //url
    String url = "https://youtube.googleapis.com/youtube/v3/search?part=snippet&q=$query&type=video&key=${ApiKeys.ytApiKey}";

    //sending request
    await http.get(Uri.parse(url)).then((value) {

      //parsing json
      var response = jsonDecode(value.body);

      //creating video objects and appending to the list
      for(int i=0; i<response['items'].length; i++){
        var video = YtVideoModel.fromJson(response['items'][i]);
        print(video.url);
        _videos.add(video);
      }

    });
    //returning the video list
    return _videos;
  }

}