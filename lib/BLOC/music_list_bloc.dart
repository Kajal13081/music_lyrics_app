import 'dart:async';

import '../models/music_list.dart';
import '../notifier/response.dart';
import '../repositories/music_list.dart';

class MusicListBloc {
  late MusicListRepository _musicListRepository;
  late StreamController _musicListController;

  StreamSink get musicListSink =>
      _musicListController.sink;

  Stream get musicListStream =>
      _musicListController.stream;

  MusicListBloc() {
    _musicListController = StreamController<Response<MusicList>>.broadcast();
    _musicListRepository = MusicListRepository();
    fetchMusicList();
  }

  fetchMusicList() async {
    musicListSink.add(Response.loading('Loading list. '));
    try {
      MusicList musicList = await _musicListRepository.fetchMusicListData();
      musicListSink.add(Response.completed(musicList));
    } catch (e) {
      musicListSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _musicListController?.close();
  }
}