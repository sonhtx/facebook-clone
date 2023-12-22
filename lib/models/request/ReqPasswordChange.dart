
class ReqChangePassword{
  String password;
  String new_password;

  ReqChangePassword(this.password, this.new_password);

  Map<String, dynamic> toJson() {
    return {
      "password": password,
      "new_password": new_password
    };
  }
}