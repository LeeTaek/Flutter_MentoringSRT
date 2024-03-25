import 'dart:convert';

class HomeData {
  final List<RecentReservation> recentReservationList;
  final List<BannerItem> bannerList;
  final List<Notice> noticeList;

  HomeData({
    required this.recentReservationList,
    required this.bannerList,
    required this.noticeList,
  });

  factory HomeData.fromJson(Map<String, dynamic> json) {
    var recentReservationList = json['recentReservationList'] as List;
    var bannerList = json['bannerList'] as List;
    var noticeList = json['noticeList'] as List;

    List<RecentReservation> recentReservations = recentReservationList.map((item) => RecentReservation.fromJson(item)).toList();
    List<BannerItem> banners = bannerList.map((item) => BannerItem.fromJson(item)).toList();
    List<Notice> notices = noticeList.map((item) => Notice.fromJson(item)).toList();

    return HomeData(
      recentReservationList: recentReservations,
      bannerList: banners,
      noticeList: notices,
    );
  }
}

class Station {
  final String stationName;
  final String stationID;

  Station({
    required this.stationName,
    required this.stationID,
  });

  factory Station.fromJson(Map<String, dynamic> json) {
    return Station(
      stationName: json['stationName'],
      stationID: json['stationID'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'stationName': stationName,
      'stationID': stationID,
    };
  }
}

class RecentReservation {
  final Station depStation;
  final Station arrStation;

  RecentReservation({
    required this.depStation,
    required this.arrStation,
  });

  factory RecentReservation.fromJson(Map<String, dynamic> json) {
    return RecentReservation(
      depStation: Station.fromJson(json['depPlace']),
      arrStation: Station.fromJson(json['arrPlace']),
    );
  }
}

class BannerItem {
  final String imgUrl;
  final String linkUrl;

  BannerItem({
    required this.imgUrl,
    required this.linkUrl,
  });

  factory BannerItem.fromJson(Map<String, dynamic> json) {
    return BannerItem(
      imgUrl: json['imgUrl'],
      linkUrl: json['linkUrl'],
    );
  }
}

class Notice {
  final String title;
  final String linkUrl;

  Notice({
    required this.title,
    required this.linkUrl,
  });

  factory Notice.fromJson(Map<String, dynamic> json) {
    return Notice(
      title: _convertUtf8(json['title']),
      linkUrl: json['linkUrl'],
    );
  }
}

  String _convertUtf8(String? message) { 
    if (message != null){
      List<int> bytes = message.codeUnits;
      return utf8.decode(bytes);
    } 
    return "decoded fail";
  }
