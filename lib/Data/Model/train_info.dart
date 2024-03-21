class TrainInfoListResponse {
  final List<TrainInfo> trainInfoList;
  final int totalCount;

  TrainInfoListResponse({
    required this.trainInfoList,
    required this.totalCount,
  });

  factory TrainInfoListResponse.fromJson(Map<String, dynamic> json) {
    return TrainInfoListResponse(
      trainInfoList: List<TrainInfo>.from(json['trainInfoList'].map((x) => TrainInfo.fromJson(x))),
      totalCount: json['totalCount'],
    );
  }
}

class TrainInfo {
  final String arrPlaceName;
  final int arrPlandTime;
  final String depPlaceName;
  final int depPlandTime;
  final int trainNo;
  final String reserveYN;

  TrainInfo({
    required this.arrPlaceName,
    required this.arrPlandTime,
    required this.depPlaceName,
    required this.depPlandTime,
    required this.trainNo,
    required this.reserveYN,
  });

  factory TrainInfo.fromJson(Map<String, dynamic> json) {
    return TrainInfo(
      arrPlaceName: json['arrPlaceName'],
      arrPlandTime: json['arrPlandTime'],
      depPlaceName: json['depPlaceName'],
      depPlandTime: json['depPlandTime'],
      trainNo: json['trainNo'],
      reserveYN: json['reserveYN'],
    );
  }
}