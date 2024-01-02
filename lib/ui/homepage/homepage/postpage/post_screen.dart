
import 'package:anti_fb/widget_dung/imageViewWidget.dart';
import 'package:anti_fb/widgets/TextButtonWidget.dart';
import 'package:flutter/material.dart';

import '../../../../api/post/comment_api.dart';
import '../../../../constants.dart';
import '../../../../models/post/PostData.dart';
import '../../../../repository/post/post_repo.dart';
import '../../../../widgets/TextWidget.dart';
import '../../../../widgets/custom_react_widget.dart';
import '../listpost.dart';
import 'MarkInputWidget.dart';
import 'markUI.dart';

class PostScreen extends StatefulWidget{
  final String id ;

  const PostScreen({super.key, required this.id,});

  @override
  State<PostScreen> createState() => PostScreenState();
}

class PostScreenState extends State<PostScreen> {
  final PostRepository _postRepository = PostRepository();
  final CommentApi _commentApi = CommentApi();

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
  }

  @override
  Widget build(BuildContext context) {
    // List<Reaction> reactionValues = Reaction.values;
    // Reaction selectedReaction = reactionValues[int.parse(post.is_felt) + 1];

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
          title: PostHeader( imageUrl: post.author!.avatar, email: post.author!.name,
            timestamp: post.created),
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
                      child: Text(post.described)),
                ),
                const SizedBox(height: 10,),
                (post.images.isNotEmpty)
                    ? ImageWidget(images: post.images)
                     : const SizedBox.shrink(),
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
