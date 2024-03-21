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

class RecentReservation {
  final String depPlaceId;
  final String depPlaceName;
  final String arrPlaceId;
  final String arrPlaceName;

  RecentReservation({
    required this.depPlaceId,
    required this.depPlaceName,
    required this.arrPlaceId,
    required this.arrPlaceName,
  });

  factory RecentReservation.fromJson(Map<String, dynamic> json) {
    return RecentReservation(
      depPlaceId: json['depPlaceId'],
      depPlaceName: json['depPlaceName'],
      arrPlaceId: json['arrPlaceId'],
      arrPlaceName: json['arrPlaceName'],
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
      title: json['title'],
      linkUrl: json['linkUrl'],
    );
  }
}
