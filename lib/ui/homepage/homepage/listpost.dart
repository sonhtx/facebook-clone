// List of posts
import 'dart:ui';

import 'package:anti_fb/models/post/PostListData.dart';
import 'package:anti_fb/models/request/ReqListPost_VideoData.dart';
import 'package:anti_fb/repository/post/post_repo.dart';
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

class ListPostWidget extends StatefulWidget {
  const ListPostWidget({super.key, required this.id});

  final String? id;

  @override
  State<ListPostWidget> createState() => ListPostWidgetState();
}

class ListPostWidgetState extends State<ListPostWidget> {

  late List<Widget> listPostsWidget = [];

  late final String? _id ;
  late String _index;
  late bool isLoading ;

  final PostRepository _postRepository = PostRepository();
  final ScrollController _scrollController = ScrollController();

  Future<void> getlistpost(RequestListPost_VideoData request) async {
    await Future.delayed(const Duration(seconds: 2));
    try {
      List<PostListData>? listPost =
      await _postRepository.getlistpost(request);
      setState(() {
        for (int i = 0; i < listPost!.length; i++) {
          PostListData curPost = listPost[i];
          listPostsWidget.add(PostWidget(
              curPost.id,
              curPost.name,
              curPost.image,
              curPost.described,
              curPost.created.substring(0, 10),
              curPost.feel,
              curPost.comment_mark,
              curPost.is_felt,
              curPost.author.name,
              curPost.author.avatar));
        }
      });
    } catch (error) {
      print(error);
    }
  }

  @override
  void initState() {
    super.initState();
    _id = widget.id;
    _index = "0";

    _scrollController.addListener(_scrollListener);

    isLoading = false;

    final RequestListPost_VideoData requestListPostData =
    RequestListPost_VideoData(_id, "1", "1", "1.0", "1.0", null, _index, "10");

    getlistpost(requestListPostData);
  }


  Future<void> getMorePost() async {
    try{
      listPostsWidget.add(Container(
        height: 20,
        color: GREEN,
          child: const Text("new post"),
      ));
      _index = (int.parse(_index) + 10).toString();

      final RequestListPost_VideoData request =
      RequestListPost_VideoData(_id, "1", "1", "1.0", "1.0", null, _index, "10");
      List<PostListData>? listPost =
      await _postRepository.getlistpost(request);
      setState(() {
        for (int i = 0; i < listPost!.length; i++) {
          PostListData curPost = listPost[i];
          listPostsWidget.add(PostWidget(
              curPost.id,
              curPost.name,
              curPost.image,
              curPost.described,
              curPost.created.substring(0, 10),
              curPost.feel,
              curPost.comment_mark,
              curPost.is_felt,
              curPost.author.name,
              curPost.author.avatar));
        }
      });
      setState(() {
        isLoading = false;
      });
    } catch(error){
      print(error);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent) {
      if(!isLoading){
      setState(() {
        isLoading = true;
      });}
      if(isLoading){
        getMorePost();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: listPostsWidget.length,
        itemBuilder: (context, index) {
          return listPostsWidget[index];
        }
      )
    );
  }
}

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
                      fontSize: 14, fontWeight: FontWeight.bold, color: GREY),
                ),
                // images != [] ? const SizedBox.shrink():const SizedBox(height: 6.0,)
              ],
            ),
          ),
          const SizedBox(height: 10,),
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
                            text: feel, textColor: GREY, fontSize: 12, width: 12,
                          ),
                          Container(
                            padding: const EdgeInsets.all(4.0),
                            decoration: const BoxDecoration(
                              color: FBBLUE, shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.thumb_up, size: 10.0, color: WHITE,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(4.0),
                            decoration: const BoxDecoration(
                              color: RED, shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.thumb_down, size: 10.0, color: WHITE,
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
          PostBottom( id: id, is_felt: is_felt,)
        ],
      ),
    );
  }
}

class PostHeader extends StatelessWidget {
  final String imageUrl;
  final String email;
  final String timestamp;

  const PostHeader(
      {super.key,
      required this.imageUrl,
      required this.email,
      required this.timestamp});

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
              Text( email, style: const TextStyle( fontWeight: FontWeight.w600,),),
              Row(
                children: [
                  Text(
                    '$timestamp  • ', style: TextStyle( color: Colors.grey[600], fontSize: 12.0,),
                  ),
                  Icon( Icons.public, color: Colors.grey[600], size: 12.0,)
                ],
              )
            ],
          ),
        ),
        IconButton(
          icon: const Icon(Icons.more_horiz),
          onPressed: () {},
        )
      ],
    );
  }
}

class PostBottom extends StatelessWidget {
  const PostBottom(
      {required this.id,
      required this.is_felt,});

  final String id;
  final String is_felt;

  static final CommentApi _commentApi = CommentApi();

  @override
  Widget build(BuildContext context) {
    List<Reaction> reactionValues = Reaction.values;
    Reaction selectedReaction = reactionValues[int.parse(is_felt) + 1];

    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Container(
        padding: const EdgeInsets.only(left: 30),
        child: Row(
          children: [
            ReactionButton(
              initialReaction: selectedReaction,
              onReactionChanged: (reaction) {
                if(reaction.name == 'none'){
                  _commentApi.deleteFeel(id);
                } else if(reaction.name == 'kudos'){
                  _commentApi.feel(id, '0');
                } else {
                  _commentApi.feel(id, '1');
                }
              },
            ),
            const TextWidget( text: 'Like', textColor: GREY, fontSize: 12, paddingLeft: 5, width: 50,
            )
          ]
        )

      ),
      Container(
          padding: const EdgeInsets.only(right: 10),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context, rootNavigator: true).push(CupertinoPageRoute(builder: (context) => PostScreen(
                  id: id,)));
            },
            child: const Row(
              children: [
                Icon(
                  Icons.comment,
                  color: GREY,
                ),
                TextWidget( text: 'Mark', textColor: GREY, fontSize: 12, paddingLeft: 5, width: 50,)
              ],
            ),
          )),
    ]);
  }
}
