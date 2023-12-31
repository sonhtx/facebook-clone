
import 'ImageData.dart';
import 'package:anti_fb/models/post/AuthorData.dart';

class PostData{
  final String id;
  final String? name;
  final String? created;
  final String? described;
  final String? modified;
  final String? fake;
  final String? trust;
  final String? kudos;
  final String? disappointed;
  final String? is_felt;
  final String? is_marked;
  final List<ImageData>? images;
  final AuthorData? author;
  final CategoryData? category;
  final String? state;
  final String? is_blocked;
  final String? can_edit;
  final String? banned;
  final String? can_mark;
  final String? can_rate;
  final String? url;
  final String? messages;

  PostData({
      required this.id,
      required this.name,
      required this.created,
      required this.described,
      required this.modified,
      required this.fake,
      required this.trust,
      required this.kudos,
      required this.disappointed,
      required this.is_felt,
      required this.is_marked,
      required this.images,
      required this.author,
      required this.category,
      required this.state,
      required this.is_blocked,
      required this.can_edit,
      required this.banned,
      required this.can_mark,
      required this.can_rate,
      required this.url,
      required this.messages});

  factory PostData.fromJson(Map<String, dynamic> json) {

    List<ImageData> images= [];
    List<dynamic> imagejson = json['image'];
    for(dynamic x in imagejson) {
      ImageData z = ImageData.fromJson(x);
      images.add(z);
    }

    AuthorData author = AuthorData.fromJson(json['author']);
    CategoryData categoryData = CategoryData.fromJson(json['category']);

    return PostData(
      id: json['id'] as String,
      name: json['name'] as String,
      created : json['created'] as String,
      described : json['described'] as String,
      modified : json['modified'] as String,
      fake : json['fake'] as String,
      trust : json['trust'] as String,
      kudos : json['kudos'] as String,
      disappointed : json['disappointed'] as String,
      is_felt : json['is_felt'] as String,
      is_marked : json['is_marked'] as String,
      images : images,
      author : author,
      category: categoryData,
      state : json['state'] as String,
      is_blocked : json['is_blocked'] as String,
      can_edit : json['can_edit'] as String,
      banned : json['banned'] as String,
      can_mark : json['can_mark'] as String,
      can_rate : json['can_rate'] as String,
      url : json['url'] as String,
      messages : json['messages'] as String,

    );
  }
}

class CategoryData{
  final String id;
  final String has_name;
  final String name;

  CategoryData({
      required this.id,
      required this.has_name,
      required this.name});
  factory CategoryData.fromJson(Map<String, dynamic> json) {
    return CategoryData(
      id: json['id'] as String,
      has_name : json['has_name'] as String,
      name : json['name'] as String,
    );
  }
}