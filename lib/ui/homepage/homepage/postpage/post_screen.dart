
import 'package:anti_fb/widget_dung/imageViewWidget.dart';
import 'package:anti_fb/widgets/IconWidget.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../models/post/ImageData.dart';
import '../../../../models/post/PostData.dart';
import '../../../../repository/post/post_repo.dart';
import '../../../../widgets/TextWidget.dart';
import '../../../../widgets/custom_react_widget.dart';
import '../listpost.dart';
import 'markUI.dart';

class PostScreen extends StatefulWidget{
  final String id ;

  const PostScreen({super.key, required this.id,});

  @override
  State<PostScreen> createState() => PostScreenState();
}

class PostScreenState extends State<PostScreen> {
  final PostRepository _postRepository = PostRepository();

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

    // getPost(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getPost(widget.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
        return Text('Error: ${snapshot.error}');
      } else {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: WHITE,
          title: PostHeader( imageUrl: post.author!.avatar, email: post.author!.name, timestamp: post.created!,),
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
                      child: Text(post.described!)),
                ),
                const SizedBox(height: 10,),
                (post.images!.isNotEmpty)
                    ? ImageWidget(images: post.images!)
                     : const SizedBox.shrink(),
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
                                TextWidget( text: "100", textColor: GREY, fontSize: 12, width: 12,),
                                Container(
                                  padding: const EdgeInsets.all(4.0),
                                  decoration: const BoxDecoration(
                                    color: FBBLUE,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon( Icons.thumb_up, size: 10.0, color: WHITE, ),
                                ),
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
                          ),
                          Container(
                            padding: const EdgeInsets.only(right: 10),
                            child: Text(
                              'Mark',
                              style: TextStyle(color: GREY[600]),
                            ),
                          )
                        ])),
                const Divider(
                  thickness: 0.1,
                  color: GREY,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10, top:5, bottom: 5),
                  child: ReactionButton(
                    initialReaction: Reaction.none,
                    onReactionChanged: (reaction) {
                      print(reaction.name);
                    },
                  ),
                ),
                // -----------------
                ListMark(id: post.id,)
                // -----------------
              ],
            ),

          )
          ),
          bottomNavigationBar: BottomTextField(id: post.id,)
        );
      }
    }
    );
  }
}



// Comment field
class BottomTextField extends StatefulWidget{
  BottomTextField({super.key, required this.id});
  final String id;


  @override
  State<BottomTextField> createState() => BottomTextFieldState();

}
class BottomTextFieldState extends State<BottomTextField> {

  TextEditingController commentController = TextEditingController();
  late Color commentButtonBackgroundColor;

  @override
  void initState() {
    super.initState();
    commentButtonBackgroundColor = GREY;
    commentController.addListener(() {
      setState(() {
        if (commentController.text != '') {
          commentButtonBackgroundColor = FBBLUE; // Change button color
        } else {
          commentButtonBackgroundColor = GREY; // Reset button color
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 10, bottom: 5),
        color: WHITE,
        height: 50,
        child: Row(
          children: [
            Expanded(
              child: TextField(controller: commentController,
                decoration: const InputDecoration( hintText: 'Comment', ),
              ),
            ),
            IconWidget(icon: Icons.send_rounded,
                color: commentButtonBackgroundColor,
                onPressed: (

                ){})
          ],
        )
    );

  }


}


