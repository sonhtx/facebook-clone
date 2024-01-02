
import 'package:anti_fb/widgets/TextButtonWidget.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../../api/post/comment_api.dart';
import '../../../../constants.dart';
import '../../../../models/post/PostData.dart';
import '../../../../repository/post/post_repo.dart';
import '../../../../widgets/AlertDialogWidget.dart';
import '../../../../widgets/TextWidget.dart';
import '../../../../widgets/custom_react_widget.dart';
import '../homepage/PostWidget.dart';
import '../homepage/postpage/MarkInputWidget.dart';
import '../homepage/postpage/markUI.dart';

class VideoScreen extends StatefulWidget{
  final String id ;
  final String video_url;
  final String author_name;
  final String author_avatar;
  final String created;
  final String described;

  const VideoScreen({super.key, required this.id, required this.author_name,
    required this.author_avatar, required this.created, required this.described,
    required this.video_url,});

  @override
  State<VideoScreen> createState() => VideoScreenState();
}

class VideoScreenState extends State<VideoScreen> {
  final PostRepository _postRepository = PostRepository();
  final CommentApi _commentApi = CommentApi();

  late VideoPlayerController _videoController;
  late ChewieController _chewieController;

  late PostData post ;

  Future<void> getPost(String id) async {
    try {
      PostData? postData =
      await _postRepository.getPost(id);
      post = postData!;
    } catch (error) {
      print(error);
    }
  }

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

    Widget content = const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text( 'Uh no ... nothing here!',),
          SizedBox( height: 16,),
          Text( 'Try selecting a different catogory',),
        ],
      ),
    );

    return FutureBuilder(
      future: getPost(widget.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return content;
        } else {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: WHITE,
          title: PostHeader(post_id: widget.id, imageUrl: widget.author_avatar, email: widget.author_name,
            timestamp: widget.created.substring(0,10), canEdit: false,),
          iconTheme: const IconThemeData(
            color: GREY, // Set the color of the back arrow icon to black
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:10),
                  child: Align(alignment: Alignment.topLeft,
                      child: Text(widget.described)),
                ),
                SizedBox(
                  height: 500,
                  child: Chewie(controller: _chewieController,) ,
                ),

                Container(
                    height: 30,
                    padding: const EdgeInsets.only(left: 5),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              TextWidget( text: post.kudos, textColor: GREY, fontSize: 12, width: 12,),
                              Container(
                                padding: const EdgeInsets.all(4.0),
                                decoration: const BoxDecoration(
                                  color: FBBLUE,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon( Icons.thumb_up, size: 10.0, color: WHITE, ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              TextWidget( text: post.disappointed, textColor: GREY, fontSize: 12, width: 12,),
                              Container(
                                padding: const EdgeInsets.all(4.0),
                                decoration: const BoxDecoration(
                                  color: RED,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon( Icons.thumb_down, size: 10.0, color: WHITE,),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              TextWidget( text: post.trust, textColor: GREY, fontSize: 12, width: 12,),
                              const Icon( Icons.check_circle_outline, size: 20.0, color: GREEN,),
                            ],
                          ),
                          Row(
                            children: [
                              TextWidget( text: post.fake, textColor: GREY, fontSize: 12, width: 12,),
                              const Icon( Icons.cancel, size: 20.0, color: RED,),
                            ],
                          ),

                        ])),
                const Divider(
                  thickness: 0.1,
                  color: GREY,
                ),
                Container(
                    padding: const EdgeInsets.only(left: 10, top:5, bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ReactionButton(
                          initialReaction: ReactionValues[int.parse(post.is_felt) + 1],
                          onReactionChanged: (reaction) {
                            if(reaction.name == 'none'){
                              _commentApi.deleteFeel(widget.id);
                            } else if(reaction.name == 'kudos'){
                              _commentApi.feel(widget.id, '1');
                            } else {
                              _commentApi.feel(widget.id, '0');
                            }
                          },
                        ),
                        _SetMarkButtonWidget(can_mark: post.can_mark, can_rate: post.can_rate, id: widget.id,),
                      ],
                    )

                ),
                // -----------------
                ListMark(id: post.id,)
                // -----------------
              ],
            ),

          )
      ),
        // bottomNavigationBar: BottomTextField(id: post.id, can_mark: post.can_mark,
        // can_rate: post.can_rate,)
      );
        }
      }
    );
  }
}
// Set Mark Button

class _SetMarkButtonWidget extends StatelessWidget{
  const _SetMarkButtonWidget({required this.can_mark,  required this.id, required this.can_rate});

  final String id;
  final String can_mark;
  final String can_rate;

  @override
  Widget build(BuildContext context) {
    return TextButtonWidget( buttonText: 'Set Mark', textColor: WHITE, backgroundColor: FBBLUE,
      radiusRoundBorder: 15,
      onPressed: (){
        switch(can_mark){
          case '1':
            showMarkInput(context, id, rateStatus(can_rate));
            break;
          case '2':
            showMarkInput(context, id, rateStatus(can_rate));
            break;
          case '0':
            showNotification(context, 'Mark status', 'Already mark, post stop allow mark');
            break;
          case '-1':
            showNotification(context, 'Mark status', "Can't mark your own post");
            break;
          case '-2':
            showNotification(context, 'Mark status', "Author've deactivated this account");
            break;
          case '-3':
            showNotification(context, 'Mark status', "Not mark, post stop allow mark");
            break;
          case '-4':
            showNotification(context, 'Mark status', "Not enough coin to mark");
            break;
          case '-5':
            showNotification(context, 'Mark status', "Not allow to mark");
            break;
        }
      },
    );

  }

}
void showNotification(BuildContext context, String title, String text) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialogWidget(title: title, text: text);
    },
  );
}

void showMarkInput(BuildContext context, String id, String rateStatus) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return MarkInputWidget(id: id, rateStatus: rateStatus,);
    },
  );
}

String rateStatus(String can_rate){
  switch(can_rate){
    case '0':
      return 'Already rate, post stop allow mark';
    case '-1':
      return "Can't rate your own post";
    case '-2':
      return "Author've deactivated this account";
    case '-3':
      return "Not rate, post stop allow rate";
    case '-4':
      return "Not enough coin to rate";
    case '-5':
      return "Not allow to rate";
  }
  return "Can rate";
}
