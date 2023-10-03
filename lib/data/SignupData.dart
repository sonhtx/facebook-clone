
class SignupData{
  String email;
  String firstName;
  String lastName;
  DateTime birthday;
  String password;



  SignupData(
      this.email, this.firstName, this.lastName, this.birthday, this.password);

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'firstname' : firstName,
      'lastname' : lastName,
      'birth': birthday.toIso8601String(),
      'password': password,
    };
  }
}