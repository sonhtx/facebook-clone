// List of posts
import 'dart:ui';

import 'package:anti_fb/api/post/post_api.dart';
import 'package:anti_fb/ui/homepage/homepage/postpage/post_screen.dart';
import 'package:anti_fb/widget_dung/imageViewWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../api/post/comment_api.dart';
import '../../../constants.dart';
import '../../../models/post/ImageData.dart';
import '../../../widgets/TextWidget.dart';
import '../../../widgets/custom_react_widget.dart';
import '../../../widgets/profile_avatar.dart';

// post
class PostWidget extends StatelessWidget {
  final String id;
  final String name;
  final List<ImageData> images;
  final String described;
  final String created;
  final String feel;
  final String comment_mark;
  final String is_felt;
  final String author_name;
  final String author_avatar_url;

  final bool canEdit;

  const PostWidget(
      this.id,
      this.name,
      this.images,
      this.described,
      this.created,
      this.feel,
      this.comment_mark,
      this.is_felt,
      this.author_name,
      this.author_avatar_url,
      this.canEdit,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      color: WHITE,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                PostHeader(
                  imageUrl: author_avatar_url,
                  email: author_name,
                  timestamp: created,
                  canEdit: canEdit,
                  post_id: id,
                ),
                const SizedBox(height: 4.0),
                // _PostCaption(caption: post.caption,),
                ReadMoreText(
                  described,
                  trimLines: 2,
                  colorClickableText: GREY,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: '    Show more',
                  trimExpandedText: '',
                  moreStyle: const TextStyle(
                      fontSize: 14, fontWeight: FONTBOLD, color: GREY),
                ),
                // images != [] ? const SizedBox.shrink():const SizedBox(height: 6.0,)
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          // ----------------------------
          (images.isNotEmpty)
              ? ImageWidget(images: images)
              : const SizedBox.shrink(),
          // ------------------------------

          Container(
              height: 30,
              padding: const EdgeInsets.only(left: 5),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          TextWidget(
                            text: feel,
                            textColor: GREY,
                            fontSize: 12,
                            width: 12,
                          ),
                          Container(
                            padding: const EdgeInsets.all(4.0),
                            decoration: const BoxDecoration(
                              color: FBBLUE,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.thumb_up,
                              size: 10.0,
                              color: WHITE,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(4.0),
                            decoration: const BoxDecoration(
                              color: RED,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.thumb_down,
                              size: 10.0,
                              color: WHITE,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text(
                        '$comment_mark Mark',
                        style: TextStyle(color: GREY[600]),
                      ),
                    )
                  ])),
          const Divider(
            thickness: 0.05,
            color: GREY,
          ),
          PostBottom(
            id: id,
            is_felt: is_felt,
          )
        ],
      ),
    );
  }
}

class PostHeader extends StatelessWidget {
  final String post_id;

  final String imageUrl;
  final String email;
  final String timestamp;

  final bool canEdit;

  const PostHeader(
      {super.key,
      required this.post_id,
      required this.imageUrl,
      required this.email,
      required this.timestamp,
      required this.canEdit});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(imageUrl: imageUrl),
        const SizedBox(width: 8.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                email,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Text(
                    '${calculateTimeDifference(timestamp)}  • ',
                    style: TextStyle(
                      color: GREY[600],
                      fontSize: 12.0,
                    ),
                  ),
                  Icon(
                    Icons.public,
                    color: GREY[600],
                    size: 12.0,
                  )
                ],
              )
            ],
          ),
        ),
        IconButton(
          icon: const Icon(Icons.more_horiz),
          onPressed: () {
            if (canEdit) {
              showEditPostSheetMenu(context, post_id);
            }
          },
        )
      ],
    );
  }
}

class PostBottom extends StatelessWidget {
  const PostBottom({
    required this.id,
    required this.is_felt,
  });

  final String id;
  final String is_felt;

  static final CommentApi _commentApi = CommentApi();

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Container(
          padding: const EdgeInsets.only(left: 30),
          child: Row(children: [
            ReactionButton(
              initialReaction: ReactionValues[int.parse(is_felt) + 1],
              onReactionChanged: (reaction) {
                if (reaction.name == 'none') {
                  _commentApi.deleteFeel(id);
                } else if (reaction.name == 'kudos') {
                  _commentApi.feel(id, '1');
                } else {
                  _commentApi.feel(id, '0');
                }
              },
            ),
            const TextWidget(
              text: 'Like',
              textColor: GREY,
              fontSize: 12,
              paddingLeft: 5,
              width: 50,
            )
          ])),
      Container(
          padding: const EdgeInsets.only(right: 10),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context, rootNavigator: true)
                  .push(CupertinoPageRoute(
                      builder: (context) => PostScreen(
                            id: id,
                          )));
            },
            child: const Row(
              children: [
                Icon(
                  Icons.comment,
                  color: GREY,
                ),
                TextWidget(
                  text: 'Mark',
                  textColor: GREY,
                  fontSize: 12,
                  paddingLeft: 5,
                  width: 50,
                )
              ],
            ),
          )),
    ]);
  }
}

void handleDeletePost(BuildContext context, String post_id) async {
  final PostApi _postApi = PostApi();

  final delStatus = await _postApi.deletePost(post_id);
  print(delStatus);
  if (delStatus) {
    ScaffoldMessenger.of(context).showSnackBar(snackBarDelPostOK);
  } else {
    showNotification(
        context, "Error", "There was an error when trying to delete post");
  }
}

void showEditPostSheetMenu(BuildContext context, String post_id) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext builderContext) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 1 / 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(8.0),
                backgroundColor: WHITE, // Màu nền của nút
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                side: BorderSide.none, // Loại bỏ border
              ),
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.edit,
                      size: 22.0,
                      color: BLACK,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Edit this post',
                      style: TextStyle(
                          color: BLACK, fontSize: 14.0, fontWeight: FONTBOLD),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                handleDeletePost(context, post_id);
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(8.0),
                backgroundColor: WHITE, // Màu nền của nút
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                side: BorderSide.none, // Loại bỏ border
              ),
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.remove_circle_outlined,
                      size: 22.0,
                      color: RED,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Remove this post',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FONTBOLD,
                        color: RED,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

final snackBarDelPostOK = SnackBar(
  content: const Text('Del post successfully, refresh page to see the change'),
  action: SnackBarAction(
    label: 'Undo',
    onPressed: () {
      // Some code to undo the change.
    },
  ),
);