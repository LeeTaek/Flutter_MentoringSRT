 class Signup { 
  final String email; 
  final String pw;
  final String birth;
  final String name; 

  Signup({
    required this.email, 
    required this.pw,
    required this.birth,
    required this.name
   }); 

    factory Signup.fromJson(Map<String, dynamic> json) {
    return Signup(
      email: json['email'],
      pw: json['pw'],
      birth: json['birth'],
      name: json['name']
    );
  }

 }