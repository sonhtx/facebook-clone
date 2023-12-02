

import 'ImageData.dart';

import 'package:anti_fb/models/post/AuthorData.dart';

class PostData{
  final String id;
  final String name;
  final String created;
  final String described;
  final String modified;
  final String fake;
  final String trust;
  final String kudos;
  final String disappointed;
  final String is_felt;
  final String is_marked;
  final List<ImageData> image;
  final AuthorData author;
  final _CategoryData category;
  final String state;
  final String is_blocked;
  final String can_edit;
  final String banned;
  final String can_mark;
  final String can_rate;
  final String url;
  final String messages;

  PostData(
      this.id,
      this.name,
      this.created,
      this.described,
      this.modified,
      this.fake,
      this.trust,
      this.kudos,
      this.disappointed,
      this.is_felt,
      this.is_marked,
      this.image,
      this.author,
      this.category,
      this.state,
      this.is_blocked,
      this.can_edit,
      this.banned,
      this.can_mark,
      this.can_rate,
      this.url,
      this.messages);
}

class _CategoryData{
  final String id;
  final String has_name;
  final String name;

  _CategoryData(this.id, this.has_name, this.name);
}