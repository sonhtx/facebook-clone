
import 'package:flutter/material.dart';

import '../../../../models/comment/comment.dart';
import '../../../../models/comment/mark.dart';
import '../../../../models/comment/poster.dart';
import '../../../../repository/post/comment_repo.dart';
import '../../../../widgets/TextWidget.dart';
import '../../../../widgets/profile_avatar.dart';


class ListMark extends StatefulWidget{
  ListMark({super.key, required this.id});
  final String id;

  late List<Widget> listMarksWidget = [];

  @override
  State<ListMark> createState() => ListMarkState();

}
class ListMarkState extends State<ListMark> {

  late String index;
  late String count;

  final CommentRepository _commentRepository = CommentRepository();

  @override
  void initState() {
    super.initState();

    index = "0";
    count = "10";

    widget.listMarksWidget = [];
    getlistmark();
  }

  Future<void> getlistmark() async {
    try {
      List<MarkData>? marklists =
      await _commentRepository.getMarkComment("1", index, count);

      setState(() {
        for (int i = 0; i < marklists!.length; i++) {
          MarkData curMark = marklists[i];
          widget.listMarksWidget.add(MarkWidget(
            id : curMark.id,
            mark_content: curMark.mark_content,
            type_of_mark: curMark.type_of_mark,
            created: curMark.created.substring(0,10),
            poster: curMark.poster,
            comments: curMark.comments,
          ));
        }
      });

    } catch (e){
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
            children: widget.listMarksWidget
        )
    );

  }

}

// Mark
class MarkWidget extends StatefulWidget{


  final String id;
  final String mark_content;
  final String type_of_mark;
  final String created;
  final PosterData poster;
  final List<CommentData> comments;

  late List<Widget> listCommentsWidget = [];

  MarkWidget({super.key, required this.id, required this.mark_content,
    required this.type_of_mark, required this.created,
    required this.poster, required this.comments});

  @override
  State<MarkWidget> createState() => MarkWidgetState();
}

class MarkWidgetState extends State<MarkWidget> {
  late bool isExpanded;

  late int numComment ;

  @override
  void initState() {
    super.initState();
    isExpanded = false;
    numComment = widget.comments.length;
    for(int i = 0; i< widget.comments.length; i++){
      CommentData curComment =  widget.comments[i];
      widget.listCommentsWidget.add(CommentWidget(
        content: curComment.content,
        created: curComment.created,
        poster: curComment.poster,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Root Comment
        Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileAvatar(imageUrl: widget.poster.avatar),
              const SizedBox(width: 8.0),
              Column(
                children: [
                  TextWidget(text: widget.poster.name, fontSize: 10, width: 100,),
                  TextWidget(text: widget.mark_content, fontSize: 10, fontWeight: FontWeight.normal,
                    width: 100,),

                  TextButton(onPressed: (){
                    setState(() { isExpanded = !isExpanded; });
                  },
                      child: TextWidget(text: '$numComment comments', fontSize: 7, width: 150,)
                  ),
                  Visibility(
                    visible: isExpanded,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Column(
                          children: widget.listCommentsWidget
                      ),
                    ),
                  ),

                ],
              )
            ],
          ),
        ),
        // Comment Count and Expand Button

      ],
    );
  }

}


class CommentWidget extends StatelessWidget{
  const CommentWidget({super.key, required this.content, required this.created, required this.poster});

  final String content;
  final String created;
  final PosterData poster;

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProfileAvatar(imageUrl: poster.avatar),
                    const SizedBox(width: 8.0),
                    Column(
                        children: [
                          TextWidget(text: poster.name, fontSize: 10, width: 100,),
                          TextWidget(text: content, fontSize: 10, fontWeight: FontWeight.normal,width: 100,)
                        ]
                    )
                  ]
              )
          )
        ]
    );
  }
}