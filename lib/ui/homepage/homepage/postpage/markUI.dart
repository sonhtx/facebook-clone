import 'package:anti_fb/models/request/ReqSetMarkComment.dart';
import 'package:anti_fb/widgets/TextFieldWidget.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../models/comment/comment.dart';
import '../../../../models/comment/mark.dart';
import '../../../../models/comment/poster.dart';
import '../../../../repository/post/comment_repo.dart';
import '../../../../widgets/IconWidget.dart';
import '../../../../widgets/TextWidget.dart';
import '../../../../widgets/profile_avatar.dart';

class ListMark extends StatefulWidget {
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
          await _commentRepository.getMarkComment(widget.id, index, count);

      setState(() {
        for (int i = 0; i < marklists!.length; i++) {
          MarkData curMark = marklists[i];
          widget.listMarksWidget.add(MarkWidget(
            your_id: widget.id,
            post_id: widget.id,
            mark_id: curMark.id,
            mark_content: curMark.mark_content,
            type_of_mark: curMark.type_of_mark,
            created: curMark.created.substring(0, 10),
            poster: curMark.poster,
            comments: curMark.comments,
          ));
        }
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(children: widget.listMarksWidget));
  }
}

// Mark
class MarkWidget extends StatefulWidget {
  final String your_id;
  final String post_id;
  final String mark_id;
  final String mark_content;
  final String type_of_mark;
  final String created;
  final PosterData poster;
  final List<CommentData> comments;

  late List<Widget> listCommentsWidget = [];

  MarkWidget(
      {super.key,
        required this.your_id,
        required this.post_id,
        required this.mark_id,
        required this.mark_content,
        required this.type_of_mark,
        required this.created,
        required this.poster,
        required this.comments});

  @override
  State<MarkWidget> createState() => MarkWidgetState();
}


class MarkWidgetState extends State<MarkWidget> {
  late bool isExpanded;

  late int numComment;
  TextEditingController commentController = TextEditingController();
  final CommentRepository _commentRepository = CommentRepository();

  @override
  void initState() {
    super.initState();
    isExpanded = false;
    numComment = widget.comments.length;
    for (int i = 0; i < widget.comments.length; i++) {
      CommentData curComment = widget.comments[i];
      widget.listCommentsWidget.add(CommentWidget(
        content: curComment.content,
        created: curComment.created.substring(0, 10),
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
              // const SizedBox(width: 8.0),
              Column(
                children: [
                  Container(
                    color: GREY[300],
                    child: Column(
                      children: [
                        TextWidget(
                          text: widget.poster.name, fontSize: 14, width: 200,
                        ),
                        TextWidget(
                          text: widget.mark_content, fontSize: 14, fontWeight: FontWeight.normal,
                          width: 200,
                        ),
                      ],
                    ),
                  ),
                  TextWidget(
                    text: widget.created, fontSize: 14, width: 200, fontWeight: FontWeight.normal,
                    textColor: GREY,
                  ),
                  TextButton(
                      child: TextWidget(
                        text: ' ---> $numComment comments',
                        fontSize: 14,
                        width: 200,
                      ),
                      onPressed: () {
                        setState(() {
                          isExpanded = !isExpanded;
                        });
                      }),
                  Visibility(
                    visible: isExpanded,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Column(children: widget.listCommentsWidget),
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFieldWidget(
                            controller: commentController, hintText: 'Add comment',
                            radiusRoundBorder: 15, fontSize: 12,
                          ),
                        ),
                        IconWidget(
                          icon: Icons.send_rounded,
                          color: BLUE,
                          onPressed: () {
                            String content = commentController.text;
                            ReqSetMarkCmtData req = ReqSetMarkCmtData.withMarkId(widget.post_id,
                                content, "0", "10", widget.mark_id, '0');
                          _commentRepository.setMarkComment(req, false);
                          setState(() {
                            numComment++;
                            widget.listCommentsWidget.add(CommentWidget(
                              content: content,
                              created: "now",
                              poster: PosterData(id: widget.your_id,name: 'you', avatar: defaultAvatar, ),
                            ));
                          });

                          })
                      ],
                    )
                  ),
                  const SizedBox(height : 10)
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

// Comment
class CommentWidget extends StatelessWidget {
  const CommentWidget(
      {super.key,
      required this.content,
      required this.created,
      required this.poster});

  final String content;
  final String created;
  final PosterData poster;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
          padding: const EdgeInsets.only(left: 20),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ProfileAvatar(imageUrl: poster.avatar),
            const SizedBox(width: 8.0),
            Column(children: [
              TextWidget(
                text: poster.name,
                fontSize: 12,
                width: 100,
              ),
              TextWidget(
                text: content,
                fontSize: 12,
                fontWeight: FontWeight.normal,
                width: 100,
              )
            ])
          ]))
    ]);
  }
}
