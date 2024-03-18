class LoginResponse {
  String name;

  LoginResponse({required this.name});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      name: json['name'],
    );
  }
}