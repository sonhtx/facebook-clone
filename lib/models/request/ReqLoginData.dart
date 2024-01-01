class LoginData{
  String email;
  String password;

  LoginData(this.email, this.password);

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
      "uuid" : "string"
    };
  }
}