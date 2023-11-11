import 'package:anti_fb/constants/constants.dart';
import 'package:anti_fb/models/post_model.dart';
import 'package:anti_fb/widgets/profile_avatar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class PostContainer extends StatelessWidget {
  final Post post;

  const PostContainer({super.key, required this.post});

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
                _PostHeader(post: post),
                const SizedBox(height: 4.0),
                // _PostCaption(caption: post.caption,),
              ReadMoreText(
                post.caption,
                trimLines: 2,
                colorClickableText: Colors.grey,
                trimMode: TrimMode.Line,
                trimCollapsedText: '    Show more',
                trimExpandedText: '',
                moreStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color:Colors.grey),
              ),
                post.imageUrl != null ? const SizedBox.shrink():const SizedBox(height: 6.0,)
              ],
            ),
          ),
          post.imageUrl != null ? Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: CachedNetworkImage(imageUrl: post.imageUrl!),
          ) :const SizedBox.shrink(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: _PostStats(post: post),
          )
        ],
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;

  const _PostHeader({required this.post});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(imageUrl: post.user.imageUrl),
        const SizedBox(width: 8.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.user.name,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Text(
                    '${post.timeAgo}  • ',
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


class _PostStats extends StatelessWidget {
  final Post post;

  const _PostStats({required this.post});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4.0),
              decoration: const BoxDecoration(
                color: Constants.facebookBlue,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.thumb_up,
                size: 10.0,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 4.0,),
            Expanded(
              child: Text(
                '${post.likes}',
                style: TextStyle(
                  color: Colors.grey[600]
                ),
              ),
            ),
            Text(
              '${post.comments} Comments',
              style: TextStyle(
                  color: Colors.grey[600]
              ),
            ),
            const SizedBox(width: 8.0,),
            Text(
              '${post.shares} Shares',
              style: TextStyle(
                  color: Colors.grey[600]
              ),
            ),
          ],
        ),
        const Divider(),
        Row(
          children: [
            PostButton(
              label: 'kudos',
              onTap: (){},
              isLiked: true,
              textColors: Constants.facebookBlue,
            ),
            PostButton(
              label: 'mark',
              onTap: (){},
              isLiked: false,
              textColors: Constants.text,
            ),
            PostButton(
              label: 'disappointed',
              onTap: (){

              },
              isLiked: true,
              textColors: Colors.red,
            ),
          ],
        )
      ],
    );
  }
}

class PostButton extends StatefulWidget {
  final String label;
  final VoidCallback? onTap;
  final bool isLiked;
  final Color textColors;

  const PostButton({super.key, required this.label, this.onTap,required this.isLiked,required this.textColors});

  @override
  State<PostButton> createState() => _PostButtonState();
}

class _PostButtonState extends State<PostButton> {
  late bool like;
  Color? textColor;

  @override
  void initState(){
    super.initState();
    like = widget.isLiked;
    if(like){
      textColor = widget.textColors;
    }else{
      textColor = Constants.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: widget.onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            height: 25.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 4.0),
                Text(widget.label,
                style: TextStyle(color: textColor),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

