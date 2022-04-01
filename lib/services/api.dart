import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:youtube_bloc/models/video_model.dart';

const String key = 'AIzaSyBnx_WrcrHvjyoSdW7NmjWz8TD2sexs_QI';

class API {
  Future<List<VideoModel>> search(String value) async {
    http.Response response = await http.get(Uri.parse(
        "https://www.googleapis.com/youtube/v3/search?part=snippet&q=$value&type=video&key=$key&maxResults=10"));
    return toDecode(response);
  }

  List<VideoModel> toDecode(http.Response response) {
    if (response.statusCode == 200) {
      var decoded = json.decode(response.body);

      List<VideoModel> videos = decoded['items'].map<VideoModel>((map) {
        return VideoModel.fromJson(map);
      }).toList();

      return videos;
    } else {
      throw Exception('Erro ao listar videos');
    }
  }

  Future<List> suggestions(String value) async {
    http.Response response = await http.get(Uri.parse(
        'http://suggestqueries.google.com/complete/search?hl=en&ds=yt&client=youtube&hjson=t&cp=1&q=$value&format=5&alt=json'));
    if (response.statusCode == 200) {
      return json.decode(response.body)[1].map((map) {
        return map[0];
      }).toList();
    } else {
      throw Exception('failed suggestion');
    }
  }
}

// "https://www.googleapis.com/youtube/v3/search?part=snippet&q=$_search&type=video&key=$API_KEY&maxResults=10&pageToken=$_nextToken"
