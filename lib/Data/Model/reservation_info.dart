
import 'package:flutter_srt/Data/Model/home_data.dart';

class ReservationInfo {
  final String boardingDate;
  final int ticketCnt;
  final int trainNo;
  final Station depStation;
  final Station arrStation;
  final String depPlandTime;
  final String arrPlandTime;
  final int price;

  ReservationInfo({
    required this.boardingDate,
    required this.ticketCnt,
    required this.trainNo,
    required this.depStation,
    required this.arrStation,
    required this.depPlandTime,
    required this.arrPlandTime,
    required this.price,
  });

  factory ReservationInfo.fromJson(Map<String, dynamic> json) {
    return ReservationInfo(
      boardingDate: json['boardingDate'],
      ticketCnt: json['ticketCnt'],
      trainNo: json['trainNo'],
      depStation: Station.fromJson(json['depPlace']),
      arrStation: Station.fromJson(json['arrPlace']),
      depPlandTime: json['depPlandTime'],
      arrPlandTime: json['arrPlandTime'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'boardingDate': boardingDate,
      'ticketCnt': ticketCnt,
      'trainNo': trainNo,
      'depPlace': depStation.toJson(),
      'arrPlace': arrStation.toJson(),
      'depPlandTime': depPlandTime,
      'arrPlandTime': arrPlandTime,
      'price': price,
    };
  }
}