class DeviceInfo {
  final String deviceId;
  final String version;

  DeviceInfo({
    required this.deviceId,
    required this.version,
  });

  factory DeviceInfo.fromJson(Map<String, dynamic> json) {
    return DeviceInfo(
      deviceId: json['deviceId'],
      version: json['version'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'deviceId': deviceId,
      'version': version,
    };
  }
}

class StatusResponse {
  final String status;

  StatusResponse({
    required this.status,
  });

  factory StatusResponse.fromJson(Map<String, dynamic> json) {
    return StatusResponse(
      status: json['status'],
    );
  }
}