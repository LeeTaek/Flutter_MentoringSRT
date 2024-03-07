class APIResponse<T> { 
  final int code;
  final String message;
  final T? data;

  APIResponse({required this.code, required this.message, this.data});

  factory APIResponse.fromJson(Map<String, dynamic> json, T Function(dynamic) fromJsonT) {
    return APIResponse(
      code: json['code'],
      message: json['message'],
      data: json['data'] != null ? fromJsonT(json['data']) : null,
    );
  }
}