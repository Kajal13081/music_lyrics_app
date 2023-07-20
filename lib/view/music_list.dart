import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../BLOC/connectivity.dart';
import '../BLOC/music_list_bloc.dart';
import '../models/music_list.dart';
import '../notifier/response.dart';

class MusicList extends StatefulWidget {
  @override
  State<MusicList> createState() => _MusicListState();
}

class _MusicListState extends State<MusicList> {
  ConnectivityBloc _netBloc = ConnectivityBloc();
  MusicListBloc _bloc = MusicListBloc();
  late final MusicList musicList;
  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    _netBloc.dispose();
    _bloc.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF05050B),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: StreamBuilder<ConnectivityResult>(
              stream: _netBloc.connectivityResultStream.asBroadcastStream(),
              builder: (context, snapshot) {
                switch (snapshot.data) {
                  case ConnectivityResult.mobile:
                  case ConnectivityResult.wifi:
                    _bloc.fetchMusicList();
                    //print('NET : ');
                    return RefreshIndicator(
                      onRefresh: () => _bloc.fetchMusicList(),
                      child: StreamBuilder<Response<MusicList>>(
                        stream: _bloc.musicListStream.asBroadcastStream(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            switch (snapshot.data?.status) {
                              case Status.LOADING:
                                return Loading(
                                    loadingMessage: snapshot.data?.message);
                                break;
                              case Status.COMPLETED:
                                return TrackList(musicList: snapshot.data?.data);
                                break;
                              case Status.ERROR:
                                break;
                            }
                          }
                          return Loading(
                            loadingMessage: 'Connecting');
                        },
                      ),
                    );
                    break;
                  case ConnectivityResult.none:
                  //print('No net: ');
                    return Center(
                      child: Text('No internet'),
                    );
                    break;
                  default:
                    return Container(
                      width: size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                            child: Text("Top Songs Played",
                              style: TextStyle(
                                fontSize: 34,
                                fontWeight: FontWeight.w700,
                                color: Color(0xffded7df),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          // show song list
                          ListView.builder(
                              shrinkWrap: true,
                              // itemCount: 3,
                              itemCount: musicList.message.body.trackList
                                  .length,
                              itemBuilder: (context, index) {
                                Track track = musicList.message.body
                                    .trackList[index].track;
                                return GestureDetector(
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        16, 0, 16, 0),
                                    child: Container(
                                      width: size.width,
                                      decoration: const BoxDecoration(
                                        // color: Color(0xff3e355e),
                                        // borderRadius: BorderRadius.circular(12),
                                          border: Border(
                                            bottom: BorderSide(width: 1.0,
                                                color: Color(0xff3e355e)),
                                          )
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 0, 8),
                                        child: ListTile(
                                          leading: const Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                0, 10, 10, 10),
                                            child: Icon(Icons.library_music,
                                              size: 50,),
                                          ),
                                          title: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 16, 0, 4),
                                            child: Text(
                                              // "Hellloooooo",
                                              track.trackName,
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w700,
                                                  color: Color(0xffded7df)
                                              ),
                                            ),
                                          ),
                                          subtitle: Text(
                                            track.albumName,
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xff848fa4)
                                            ),
                                          ),
                                          trailing: SizedBox(
                                            width: size.width * 0.1,
                                            child: Text(
                                              // "Hellloo",
                                              track.artistName,
                                              softWrap: true,
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xff848fa4)
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }
                          )
                        ],
                      ),
                    );
                }
              }),
        ),
      ),
    );
  }
}
class Loading extends StatelessWidget {
  final String? loadingMessage;

  const Loading({required Key key, this.loadingMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            loadingMessage!,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          SizedBox(height: 24),
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        ],
      ),
    );
  }
}
