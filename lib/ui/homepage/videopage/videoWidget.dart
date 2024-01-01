
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:video_player/video_player.dart';

import '../../../constants.dart';
import '../../../widgets/TextWidget.dart';
import '../homepage/listpost.dart';

class VideoWidget extends StatefulWidget {
  final String id;
  final String name;
  final String video_url;
  final String described;
  final String created;
  final String feel;
  final String comment_mark;
  final String is_felt;
  final String author_name;
  final String author_avatar_url;

  const VideoWidget(this.id,
      this.name,
      this.video_url,
      this.described,
      this.created,
      this.feel,
      this.comment_mark,
      this.is_felt,
      this.author_name,
      this.author_avatar_url,
      {super.key});

  @override
  State<VideoWidget> createState() => VideoWidgetState();
}

class VideoWidgetState extends State<VideoWidget> {
  late VideoPlayerController _videoController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();

    _videoController = VideoPlayerController.networkUrl(Uri.parse(widget.video_url));
    _chewieController = ChewieController(
      videoPlayerController: _videoController,
      aspectRatio: 16 / 9, // adjust as needed
      autoInitialize: true,
      looping: true, // set to false if you don't want the video to loop
    );
  }

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
                  imageUrl: widget.author_avatar_url,
                  email: widget.author_name,
                  timestamp: widget.created,
                ),
                const SizedBox(height: 4.0),
                // _PostCaption(caption: post.caption,),
                ReadMoreText(
                  widget.described,
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
          //------------------------------------------------
          SizedBox(
            height: 500,
            child: Chewie(controller: _chewieController,) ,
          ),
          //------------------------------------------------

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
                          TextWidget(text: widget.feel, textColor: GREY, fontSize: 12, width: 12,),
                          Container(
                            padding: const EdgeInsets.all(4.0),
                            decoration: const BoxDecoration(
                              color: FBBLUE, shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.thumb_up, size: 10.0, color: WHITE,),
                          ),
                          Container(
                            padding: const EdgeInsets.all(4.0),
                            decoration: const BoxDecoration(
                              color: RED, shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.thumb_down, size: 10.0, color: WHITE,),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text(
                        '${widget.comment_mark} Mark',
                        style: TextStyle(color: GREY[600]),
                      ),
                    )
                  ])),
          const Divider(
            thickness: 0.05,
            color: GREY,
          ),
          PostBottom( id: widget.id, is_felt: widget.is_felt,)
        ],
      ),
    );
  }
}