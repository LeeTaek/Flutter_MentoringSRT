class ReservationInfo {
  final String boardingDate;
  final int ticketCnt;
  final int trainNo;
  final String depPlaceId;
  final String depPlaceName;
  final String depPlandTime;
  final String arrPlaceId;
  final String arrPlaceName;
  final String arrPlandTime;
  final int price;

  ReservationInfo({
    required this.boardingDate,
    required this.ticketCnt,
    required this.trainNo,
    required this.depPlaceId,
    required this.depPlaceName,
    required this.depPlandTime,
    required this.arrPlaceId,
    required this.arrPlaceName,
    required this.arrPlandTime,
    required this.price,
  });

  factory ReservationInfo.fromJson(Map<String, dynamic> json) {
    return ReservationInfo(
      boardingDate: json['boardingDate'],
      ticketCnt: json['ticketCnt'],
      trainNo: json['trainNo'],
      depPlaceId: json['depPlaceId'],
      depPlaceName: json['depPlaceName'],
      depPlandTime: json['depPlandTime'],
      arrPlaceId: json['arrPlaceId'],
      arrPlaceName: json['arrPlaceName'],
      arrPlandTime: json['arrPlandTime'],
      price: json['price'],
    );
  }

   Map<String, dynamic> toJson() {
    return {
      'boardingDate': boardingDate,
      'ticketCnt': ticketCnt,
      'trainNo': trainNo,
      'depPlaceId': depPlaceId,
      'depPlaceName': depPlaceName,
      'depPlandTime': depPlandTime,
      'arrPlaceId': arrPlaceId,
      'arrPlaceName': arrPlaceName,
      'arrPlandTime': arrPlandTime,
      'price': price,
    };
  }
}