
class PosterData{
  final String id;
  final String name;
  final String avatar;

  PosterData({required this.id, required this.name, required this.avatar});

  factory PosterData.fromJson(Map<String, dynamic> json) {
    return PosterData(
      id: json['id'] as String,
      name: json['name'] as String,
      avatar: json['avatar'] as String,
    );
  }
}