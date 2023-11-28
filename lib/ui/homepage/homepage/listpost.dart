


// List of posts
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:readmore/readmore.dart';

import '../../../constants.dart';
import '../../../widgets/TextWidget.dart';
import '../../../widgets/profile_avatar.dart';

class ListPostWidget extends StatefulWidget {

  const ListPostWidget({super.key});

  @override
  State<ListPostWidget> createState() => _ListPostWidgetState();
}

class _ListPostWidgetState extends State<ListPostWidget> {
  late List<Widget> listPosts = [];
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 10; i++) {
      listPosts.add(const PostWidget('abc@123.com','10h37', 'ssssssssssiiiiiiiiiiiiiiiiiiiiiiiiiiuuuuuuuuuuuuuuu'
          'uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu'
          'uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu'
          'uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu'
          'uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu',[]));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: GREY,
        child: Column( children: listPosts,)
    );
  }
}

// post
class PostWidget extends StatefulWidget {
  final String useremail;
  final String timestamp;
  final String content;
  final List<XFile> images;

  const PostWidget(this.useremail, this.timestamp, this.content, this.images, {super.key});
  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget>{
  late String useremail;
  late String timestamp;
  late String content;
  late List<XFile> images;

  late String imageUrl;

  late double height;
  late bool kudosChoose;
  late bool disChoose;
  @override
  void initState() {
    super.initState();
    timestamp = widget.timestamp;
    useremail = widget.useremail;
    content = widget.content;
    images = widget.images;

    imageUrl = 'assets/images/messi-world-cup.png';

    height = 30;
    kudosChoose = false;
    disChoose = false;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _PostHeader(imageUrl: imageUrl, email: useremail, timestamp: timestamp, ),
                const SizedBox(height: 4.0),
                // _PostCaption(caption: post.caption,),
                ReadMoreText(
                  content,
                  trimLines: 2,
                  colorClickableText: Colors.grey,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: '    Show more',
                  trimExpandedText: '',
                  moreStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: GREY),
                ),
                imageUrl != null ? const SizedBox.shrink():const SizedBox(height: 6.0,)
              ],
            ),
          ),
          imageUrl != null ? Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: CachedNetworkImage(imageUrl : imageUrl),
          ) :const SizedBox.shrink(),
          Container(
              height: 30,
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                  children: [
                    Row (
                      children: [
                        Container(
                          padding: const EdgeInsets.all(4.0),
                          decoration: const BoxDecoration( color: FBBLUE, shape: BoxShape.circle,),
                          child: const Icon( Icons.thumb_up, size: 10.0, color: WHITE,),
                        ),
                        const TextWidget(text: '10', textColor: FBBLUE ,fontSize: 10, paddingLeft: 5, width: 30,)
                      ],
                    ),
                    Row (
                      children: [
                        Container(
                          padding: const EdgeInsets.all(4.0),
                          decoration: const BoxDecoration( color: RED, shape: BoxShape.circle,),
                          child: const Icon( Icons.thumb_down, size: 10.0, color: WHITE,),
                        ),
                        const TextWidget(text: '10', textColor: RED ,fontSize: 10, paddingLeft: 5, width: 30,)
                      ],
                    ),
                    const SizedBox(width: 4.0,),
                    Text('Mark', style: TextStyle(color: GREY[600]),),
                  ]
              )
          ),
          const Divider( thickness: 0.1, color: GREY, ),
          SizedBox(
              height : 30,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: const EdgeInsets.only(left: 10),
                        child : GestureDetector(
                          onTap: (){ setState(() {
                            if(!disChoose){ kudosChoose = !kudosChoose;}
                          });},
                          child: Row (
                            children: [
                              Icon( Icons.sentiment_satisfied_alt, color: kudosChoose ? FBBLUE : GREY ,),
                              TextWidget(text: 'Kudos', textColor: kudosChoose ? FBBLUE : GREY,fontSize: 12, paddingLeft: 5, width: 50,)
                            ],
                          ),
                        )
                    ),
                    GestureDetector(
                      onTap: (){ setState(() {
                        if(!kudosChoose){ disChoose = !disChoose;}
                      });},
                      child: Row (
                        children: [
                          Icon( Icons.sentiment_dissatisfied_sharp, color: disChoose ? RED : GREY ,),
                          TextWidget(text: 'Dissapoint', textColor: disChoose ? RED : GREY,fontSize: 12, paddingLeft: 5, width: 70,)
                        ],
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.only(right: 10),
                        child : GestureDetector(
                          onTap: (){
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => PostScreen(),
                            //   ),
                            // );
                          },
                          child: const Row (
                            children: [
                              Icon( Icons.comment, color: GREY,),
                              TextWidget(text: 'Mark', textColor: GREY,fontSize: 12, paddingLeft: 5, width: 40,)
                            ],
                          ),
                        )
                    ),
                  ]
              )
          )

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

