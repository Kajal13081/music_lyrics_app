class MusicLyrics {
  Message? message;

  MusicLyrics({required this.message});

  MusicLyrics.fromJson(Map<String, dynamic> json) {
    message =
    json['message'] != null ? new Message.fromJson(json['message']) : null;
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
    json['header'] != null ? new Header.fromJson(json['header']) : null;
    body = json['body'] != null ? new Body.fromJson(json['body']) : null;
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
  Lyrics? lyrics;

  Body({required this.lyrics});

  Body.fromJson(Map<String, dynamic> json) {
    lyrics =
    json['lyrics'] != null ? new Lyrics.fromJson(json['lyrics']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    final lyrics = this.lyrics;
    if (lyrics != null) {
      data['lyrics'] = lyrics.toJson();
    }
    return data;
  }
}

class Lyrics {
  late int lyricsId;
  late int explicit;
  late String lyricsBody;
  late String scriptTrackingUrl;
  late String pixelTrackingUrl;
  late String lyricsCopyright;
  late String updatedTime;

  Lyrics(
      {required this.lyricsId,
        required this.explicit,
        required this.lyricsBody,
        required this.scriptTrackingUrl,
        required this.pixelTrackingUrl,
        required this.lyricsCopyright,
        required this.updatedTime});

  Lyrics.fromJson(Map<String, dynamic> json) {
    lyricsId = json['lyrics_id'];
    explicit = json['explicit'];
    lyricsBody = json['lyrics_body'];
    scriptTrackingUrl = json['script_tracking_url'];
    pixelTrackingUrl = json['pixel_tracking_url'];
    lyricsCopyright = json['lyrics_copyright'];
    updatedTime = json['updated_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lyrics_id'] = this.lyricsId;
    data['explicit'] = this.explicit;
    data['lyrics_body'] = this.lyricsBody;
    data['script_tracking_url'] = this.scriptTrackingUrl;
    data['pixel_tracking_url'] = this.pixelTrackingUrl;
    data['lyrics_copyright'] = this.lyricsCopyright;
    data['updated_time'] = this.updatedTime;
    return data;
  }
}