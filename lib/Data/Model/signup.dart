 class Signup { 
  final String email; 
  final String pw;
  final String brith;
  final String name; 

  Signup({
    required this.email, 
    required this.pw,
    required this.brith,
    required this.name
   }); 

    factory Signup.fromJson(Map<String, dynamic> json) {
    return Signup(
      email: json['code'],
      pw: json['message'],
      brith: json['data'],
      name: json['message']
    );
  }

 }