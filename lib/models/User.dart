// add attributes and remove required for some attributes
class User {
  final String id;
  final String email;
  final String username;
  final String token;
  final String avatar;
  final String active;
  final String coins;
  final String description;
  final String coverImage;
  final String link;
  final String address;
  final String city;
  final String country;

  User({
    required this.id,
    this.email = "",
    required this.username,
    this.token = "",
    required this.avatar,
    this.active = "1",
    required this.coins,
    required this.coverImage,
    required this.address,
    required this.country,
    required this.description,
    required this.link,
    required this.city,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      // email : json['data']['email'] as String,
      username: json['username'] as String,
      // token: json['token'] as String,
      avatar: json['avatar'] as String,
      // active: json['active'] as String,
      coins: json['coins'] as String,
      description: json['description'] as String,
      coverImage: json['cover_image'] as String,
      link: json['link'] as String,
      address: json['address'] as String,
      country: json['country'] as String,
      city: json['city'] as String,
    );
  }
}
