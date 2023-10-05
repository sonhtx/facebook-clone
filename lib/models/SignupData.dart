
class SignupData{
  String email;
  String firstName;
  String lastName;
  DateTime birthday;
  String password;

  SignupData(
      this.email, this.firstName, this.lastName, this.birthday, this.password);

  Map<String, dynamic> toJson() {
    String birth = birthday.toIso8601String() ;
    return {
      "email": email,
      "firstname" : firstName,
      "lastname" : lastName,
      "birth" : birth,
      "password": password,
    };
  }
}