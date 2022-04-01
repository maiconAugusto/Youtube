import 'dart:async';
import 'dart:ui';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:youtube_bloc/models/video_model.dart';
import 'package:youtube_bloc/services/api.dart';

class VideosBloc implements BlocBase {
  late API api;
  List<VideoModel> _videos = [];

  final StreamController _videosController = StreamController();
  Stream get outVideos => _videosController.stream;

  final StreamController _searchController = StreamController();
  Sink get inSearch => _searchController.sink;

  VideosBloc() {
    api = API();
    _searchController.stream.listen(((event) => _search(event)));
  }

  _search(String search) async {
    _videos = await api.search(search);
    _videosController.sink.add(_videos);
  }

  @override
  void addListener(VoidCallback listener) {
    // TODO: implement addListener
  }

  @override
  void dispose() {
    _videosController.close();
    _searchController.close();
  }

  @override
  // TODO: implement hasListeners
  bool get hasListeners => throw UnimplementedError();

  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
  }

  @override
  void removeListener(VoidCallback listener) {
    // TODO: implement removeListener
  }
}
