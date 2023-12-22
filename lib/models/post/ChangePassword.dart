class ChangePassword{
  final String code;
  final String message;
  final String? token;

  ChangePassword({required this.code, required this.message, required this.token});

  factory ChangePassword.fromJson(Map<String, dynamic> json){
    if(json.length == 2){
      return ChangePassword(
          code: json['code'],
          message: json['code'],
          token: null
      );
    }
    else{
      return ChangePassword(
          code: json['code'],
          message: json['code'],
          token:json['data']['token']
      );
    }
  }

}