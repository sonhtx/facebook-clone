

class ImageData{
  final String id;
  final String url;

  ImageData({required this.id, required this.url});
  factory ImageData.fromJson(Map<String, dynamic> json) {
    return ImageData(
      id: json['id'] as String,
      url: json['url'] as String,
    );
  }

}