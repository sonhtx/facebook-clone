

import 'ImageData.dart';

import 'package:anti_fb/models/post/AuthorData.dart';

class PostData{
  final String id;
  final String name;
  final String created;
  final String described;
  final int modified;
  final int fake;
  final int trust;
  final int kudos;
  final int disappointed;
  final int is_felt;
  final int is_marked;
  final List<ImageData> image;
  final AuthorData author;
  final _CategoryData category;
  final String state;
  final int is_blocked;
  final int can_edit;
  final int banned;
  final int can_mark;
  final int can_rate;
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
  final int has_name;
  final String name;

  _CategoryData(this.id, this.has_name, this.name);
}