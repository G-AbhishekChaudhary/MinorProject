class User {
  String name;
  String email;
  String phoneno;
  String password;

  User();

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'],
        phoneno = json['phoneno'],
        password = json['password'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'phoneno': phoneno,
        'password': password,
      };
}
