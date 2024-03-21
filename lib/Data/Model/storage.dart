class StorageListResponse {
  final List<StorageItem> storageList;

  StorageListResponse({required this.storageList});

  factory StorageListResponse.fromJson(Map<String, dynamic> json) {
    var storageList = json['storageList'] as List;
    List<StorageItem> storageItemList = storageList.map((item) => StorageItem.fromJson(item)).toList();
    return StorageListResponse(storageList: storageItemList);
  }
}

class StorageItem {
  final String boardingDate;
  final int trainNo;
  final String depPlaceId;
  final String depPlaceName;
  final String depPlandTime;
  final String arrPlaceId;
  final String arrPlaceName;
  final String arrPlandTime;
  final String reservationDate;
  final String ticketingStatus;
  final int price;
  final List<SrtDetail> srtDetailList;

  StorageItem({
    required this.boardingDate,
    required this.trainNo,
    required this.depPlaceId,
    required this.depPlaceName,
    required this.depPlandTime,
    required this.arrPlaceId,
    required this.arrPlaceName,
    required this.arrPlandTime,
    required this.reservationDate,
    required this.ticketingStatus,
    required this.price,
    required this.srtDetailList,
  });

  factory StorageItem.fromJson(Map<String, dynamic> json) {
    var srtDetailList = json['srtDetailList'] as List;
    List<SrtDetail> srtDetailItemList = srtDetailList.map((item) => SrtDetail.fromJson(item)).toList();
    return StorageItem(
      boardingDate: json['boardingDate'],
      trainNo: json['trainNo'],
      depPlaceId: json['depPlaceId'],
      depPlaceName: json['depPlaceName'],
      depPlandTime: json['depPlandTime'],
      arrPlaceId: json['arrPlaceId'],
      arrPlaceName: json['arrPlaceName'],
      arrPlandTime: json['arrPlandTime'],
      reservationDate: json['reservationDate'],
      ticketingStatus: json['ticketingStatus'],
      price: json['price'],
      srtDetailList: srtDetailItemList,
    );
  }
}

class SrtDetail {
  final String ticketNo;
  final int hocha;
  final String seatNumber;

  SrtDetail({
    required this.ticketNo,
    required this.hocha,
    required this.seatNumber,
  });

  factory SrtDetail.fromJson(Map<String, dynamic> json) {
    return SrtDetail(
      ticketNo: json['ticketNo'],
      hocha: json['hocha'],
      seatNumber: json['seatNumber'],
    );
  }
}