class MusicList {
  Message? message;

  MusicList({required this.message});

  MusicList.fromJson(Map<String, dynamic> json) {
    message =
    (json['message'] != null ? new Message.fromJson(json['message']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    final message = this.message;
    if (message != null) {
      data['message'] = message.toJson();
    }
    return data;
  }
}

class Message {
  Header? header;
  Body? body;

  Message({required this.header, required this.body});

  Message.fromJson(Map<String, dynamic> json) {
    header =
    (json['header'] != null ? new Header.fromJson(json['header']) : null)!;
    body = (json['body'] != null ? new Body.fromJson(json['body']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    final header = this.header;
    if (header != null) {
      data['header'] = header.toJson();
    }
    final body = this.body;
    if (body != null) {
      data['body'] = body.toJson();
    }
    return data;
  }
}

class Header {
  int? statusCode;
  double? executeTime;

  Header({required this.statusCode, required this.executeTime});

  Header.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    executeTime = json['execute_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_code'] = this.statusCode;
    data['execute_time'] = this.executeTime;
    return data;
  }
}

class Body {
  List<TrackList>? trackList;

  Body({required this.trackList});

  Body.fromJson(Map<String, dynamic> json) {
    if (json['track_list'] != null) {
      trackList = <TrackList>[]; // Specify the type of the list as <TrackList>
      json['track_list'].forEach((v) {
        trackList?.add(TrackList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    final trackList = this.trackList;
    if (trackList != null) {
      data['track_list'] = trackList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TrackList {
  Track? track;

  TrackList({required this.track});

  TrackList.fromJson(Map<String, dynamic> json) {
    track = (json['track'] != null ? new Track.fromJson(json['track']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    final track = this.track;
    if (track != null) {
      data['track'] = track.toJson();
    }
    return data;
  }
}

class Track {
  late int trackId;
  late String trackName;
  late List<Null> trackNameTranslationList;
  late int trackRating;
  late int commontrackId;
  late int instrumental;
  late int explicit;
  late int hasLyrics;
  late int hasSubtitles;
  late int hasRichsync;
  late int numFavourite;
  late int albumId;
  late String albumName;
  late int artistId;
  late String artistName;
  late String trackShareUrl;
  late String trackEditUrl;
  late int restricted;
  late String updatedTime;
  late PrimaryGenres primaryGenres;

  Track(
      {required this.trackId,
        required this.trackName,
        required this.trackRating,
        required this.commontrackId,
        required this.instrumental,
        required this.explicit,
        required this.hasLyrics,
        required this.hasSubtitles,
        required this.hasRichsync,
        required this.numFavourite,
        required this.albumId,
        required this.albumName,
        required this.artistId,
        required this.artistName,
        required this.trackShareUrl,
        required this.trackEditUrl,
        required this.restricted,
        required this.updatedTime,
        required this.primaryGenres});

  Track.fromJson(Map<String, dynamic> json) {
    trackId = json['track_id'];
    trackName = json['track_name'];
    trackRating = json['track_rating'];
    commontrackId = json['commontrack_id'];
    instrumental = json['instrumental'];
    explicit = json['explicit'];
    hasLyrics = json['has_lyrics'];
    hasSubtitles = json['has_subtitles'];
    hasRichsync = json['has_richsync'];
    numFavourite = json['num_favourite'];
    albumId = json['album_id'];
    albumName = json['album_name'];
    artistId = json['artist_id'];
    artistName = json['artist_name'];
    trackShareUrl = json['track_share_url'];
    trackEditUrl = json['track_edit_url'];
    restricted = json['restricted'];
    updatedTime = json['updated_time'];
    primaryGenres = (json['primary_genres'] != null
        ? new PrimaryGenres.fromJson(json['primary_genres'])
        : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['track_id'] = this.trackId;
    data['track_name'] = this.trackName;
    data['track_rating'] = this.trackRating;
    data['commontrack_id'] = this.commontrackId;
    data['instrumental'] = this.instrumental;
    data['explicit'] = this.explicit;
    data['has_lyrics'] = this.hasLyrics;
    data['has_subtitles'] = this.hasSubtitles;
    data['has_richsync'] = this.hasRichsync;
    data['num_favourite'] = this.numFavourite;
    data['album_id'] = this.albumId;
    data['album_name'] = this.albumName;
    data['artist_id'] = this.artistId;
    data['artist_name'] = this.artistName;
    data['track_share_url'] = this.trackShareUrl;
    data['track_edit_url'] = this.trackEditUrl;
    data['restricted'] = this.restricted;
    data['updated_time'] = this.updatedTime;
    if (this.primaryGenres != null) {
      data['primary_genres'] = this.primaryGenres.toJson();
    }
    return data;
  }
}

class PrimaryGenres {
  List<MusicGenreList>? musicGenreList;

  PrimaryGenres({required this.musicGenreList});

  PrimaryGenres.fromJson(Map<String, dynamic> json) {
    if (json['music_genre_list'] != null) {
      musicGenreList = <MusicGenreList>[]; // Specify the type of the list as <MusicGenreList>
      json['music_genre_list'].forEach((v) {
        musicGenreList?.add(MusicGenreList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    final musicGenreList = this.musicGenreList;
    if (musicGenreList != null) {
      data['music_genre_list'] =
          musicGenreList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MusicGenreList {
  MusicGenre? musicGenre;

  MusicGenreList({required this.musicGenre});

  MusicGenreList.fromJson(Map<String, dynamic> json) {
    musicGenre = (json['music_genre'] != null
        ? new MusicGenre.fromJson(json['music_genre'])
        : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    final musicGenre = this.musicGenre;
    if (musicGenre != null) {
      data['music_genre'] = musicGenre.toJson();
    }
    return data;
  }
}

class MusicGenre {
  late int musicGenreId;
  late int musicGenreParentId;
  late String musicGenreName;
  late String musicGenreNameExtended;
  late String musicGenreVanity;

  MusicGenre(
      {required this.musicGenreId,
        required this.musicGenreParentId,
        required this.musicGenreName,
        required this.musicGenreNameExtended,
        required this.musicGenreVanity});

  MusicGenre.fromJson(Map<String, dynamic> json) {
    musicGenreId = json['music_genre_id'];
    musicGenreParentId = json['music_genre_parent_id'];
    musicGenreName = json['music_genre_name'];
    musicGenreNameExtended = json['music_genre_name_extended'];
    musicGenreVanity = json['music_genre_vanity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['music_genre_id'] = this.musicGenreId;
    data['music_genre_parent_id'] = this.musicGenreParentId;
    data['music_genre_name'] = this.musicGenreName;
    data['music_genre_name_extended'] = this.musicGenreNameExtended;
    data['music_genre_vanity'] = this.musicGenreVanity;
    return data;
  }
}