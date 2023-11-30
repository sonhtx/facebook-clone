
// List of posts
import 'package:anti_fb/models/post/PostListData.dart';
import 'package:anti_fb/models/request/ReqListPostData.dart';
import 'package:anti_fb/repository/post/getlistpost_repo.dart';
import 'package:anti_fb/ui/homepage/homepage/postpage/post_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../constants.dart';
import '../../../models/post/ImageData.dart';
import '../../../widgets/TextWidget.dart';
import '../../../widgets/profile_avatar.dart';
import '../nav_screen.dart';

class ListPostWidget extends StatefulWidget {

  const ListPostWidget({super.key, required this.postlists});

  final List<PostListData> postlists;

  @override
  State<ListPostWidget> createState() => _ListPostWidgetState();
}

class _ListPostWidgetState extends State<ListPostWidget> {
  late List<PostListData> _postlists;

  late List<Widget> listPostsWidget = [];

  static final RequestListPostData requestListPostData = RequestListPostData("1", "1", "1","1.0", "1.0", "6", "0", "10");

  Future<void> getlistpost() async{
    try{
      List<PostListData>? listPost = await GetListPostRepository.getlistpost(requestListPostData);
      for (int i = 0; i < listPost!.length; i++) {
        PostListData curPost = listPost[i];
        listPostsWidget.add(PostWidget(
            curPost.id, curPost.name, curPost.image, curPost.described, curPost.created, curPost.feel,
            curPost.comment_mark, curPost.is_felt, curPost.author.name, curPost.author.avatar
        ));
      }
      final NavScreenState? navState = context.findAncestorStateOfType<NavScreenState>();
      navState?.postlist = listPost;
    }catch (error) {
      print(error);
    }
  }

  @override
  void initState() {
    super.initState();
    _postlists = widget.postlists;

    setState(() {
      if(_postlists.isEmpty){
        getlistpost();
      } else {
        for (int i = 0; i < _postlists!.length; i++) {
          PostListData curPost = _postlists[i];
          listPostsWidget.add(PostWidget(
              curPost.id, curPost.name, curPost.image, curPost.described, curPost.created, curPost.feel,
              curPost.comment_mark, curPost.is_felt, curPost.author.name, curPost.author.avatar
          ));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: GREY,
        child: Column( children: listPostsWidget,)
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
  final String author_name ;
  final String author_avatar_url;


  PostWidget(
      this.id, this.name, this.images, this.described, this.created, this.feel,
      this.comment_mark, this.is_felt, this.author_name, this.author_avatar_url, {super.key} );

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
                _PostHeader(imageUrl: author_avatar_url, email: author_name, timestamp: created, ),
                const SizedBox(height: 4.0),
                // _PostCaption(caption: post.caption,),
                ReadMoreText(
                  described,
                  trimLines: 2,
                  colorClickableText: GREY,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: '    Show more',
                  trimExpandedText: '',
                  moreStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: GREY),
                ),
                // images != [] ? const SizedBox.shrink():const SizedBox(height: 6.0,)
              ],
            ),
          ),

          // ----------------------------
          images != [] ?
            SizedBox (
              height: 200,
               child: GridView.builder(
                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                   crossAxisCount: 4, // Adjust the number of images per row as needed
                 ),
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: CachedNetworkImage(
                        imageUrl: images[index].url,
                        placeholder: (context, url) => const CircularProgressIndicator(),
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                      ),
                    );
                  },
                )
            ) :const SizedBox.shrink(),
          // ------------------------------

          Container(
              height: 30,
              padding: const EdgeInsets.only(left: 5),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding : const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          TextWidget(text: feel, textColor: GREY ,fontSize: 12, width: 12,),
                          Container(
                            padding: const EdgeInsets.all(4.0),
                            decoration: const BoxDecoration( color: FBBLUE, shape: BoxShape.circle,),
                            child: const Icon( Icons.thumb_up, size: 10.0, color: WHITE,),
                          ),
                          Container(
                            padding: const EdgeInsets.all(4.0),
                            decoration: const BoxDecoration( color: RED, shape: BoxShape.circle,),
                            child: const Icon( Icons.thumb_down, size: 10.0, color: WHITE,),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding : const EdgeInsets.only(right: 10),
                      child : Text('$comment_mark Mark', style: TextStyle(color: GREY[600]),),
                    )
                  ]
              )
          ),
          const Divider( thickness: 0.1, color: GREY, ),
          _PostBottom(id: id, is_felt: is_felt)
        ],
      ),
    );
  }

}

class _PostHeader extends StatelessWidget {
  final String imageUrl;
  final String email;
  final String timestamp;

  const _PostHeader({required this.imageUrl, required this.email, required this.timestamp});


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
                    '$timestamp  • ',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12.0,
                    ),),
                  Icon(
                    Icons.public,
                    color: Colors.grey[600],
                    size: 12.0,
                  )
                ],
              )
            ],
          ),
        ),
        IconButton(
          icon: const Icon(Icons.more_horiz),
          onPressed: (){},
        )
      ],
    );
  }
}


class _PostBottom extends StatefulWidget{
  const _PostBottom({super.key, required this.id, required this.is_felt});

  final String id;
  final String is_felt;


  @override
  State<_PostBottom> createState() => _PostBottomState();
}

class _PostBottomState extends State<_PostBottom>{

  late bool kudosChoose;
  late bool disChoose;

  @override
  void initState() {
    super.initState();
    String is_felt = widget.is_felt;

    kudosChoose = false;
    disChoose = false;

    if(is_felt == '0') {
      kudosChoose = true;
    } else if (is_felt == '1'){
      disChoose = true;
    }

  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 30,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  padding: const EdgeInsets.only(left: 10),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (!disChoose) {
                          kudosChoose = !kudosChoose;
                        }
                      });
                    },
                    child: Row(
                      children: [
                        Icon(Icons.sentiment_satisfied_alt,
                          color: kudosChoose ? FBBLUE : GREY,),
                        TextWidget(text: 'Kudos',
                          textColor: kudosChoose ? FBBLUE : GREY,
                          fontSize: 12,
                          paddingLeft: 5,
                          width: 50,)
                      ],
                    ),
                  )
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (!kudosChoose) {
                      disChoose = !disChoose;
                    }
                  });
                },
                child: Row(
                  children: [
                    Icon(Icons.sentiment_dissatisfied_sharp,
                      color: disChoose ? RED : GREY,),
                    TextWidget(text: 'Dissapoint',
                      textColor: disChoose ? RED : GREY,
                      fontSize: 12,
                      paddingLeft: 5,
                      width: 70,)
                  ],
                ),
              ),
              Container(
                  padding: const EdgeInsets.only(right: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PostScreen(id: widget.id,),
                        ),
                      );
                    },
                    child: const Row (
                      children: [
                        Icon(Icons.comment, color: GREY,),
                        TextWidget(text: 'Mark',
                          textColor: GREY,
                          fontSize: 12,
                          paddingLeft: 5,
                          width: 40,)
                      ],
                    ),
                  )
              ),
            ]
        )
    );
  }
}
