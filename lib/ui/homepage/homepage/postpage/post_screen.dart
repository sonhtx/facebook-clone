

import 'package:anti_fb/widget_dung/imageViewWidget.dart';
import 'package:anti_fb/widgets/IconWidget.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../models/post/ImageData.dart';
import '../../../../widgets/TextWidget.dart';
import '../listpost.dart';
import 'markUI.dart';

class PostScreen extends StatelessWidget{
  final String id ;
  final String name;
  final List<ImageData> images;
  final String described;
  final String created;
  final String feel;
  final String comment_mark;
  final String is_felt;
  final String author_name;
  final String author_avatar_url;


  const PostScreen({super.key, required this.id, required this.name, required this.images, required this.described, required this.created, required this.feel, required this.comment_mark, required this.is_felt, required this.author_name, required this.author_avatar_url});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: WHITE,
        title: PostHeader( imageUrl: author_avatar_url, email: author_name, timestamp: created,),
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
                    child: Text(described)),
              ),
              const SizedBox(height: 10,),
              (images.isNotEmpty)
                  ? ImageWidget(images: images)
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
                              TextWidget( text: feel, textColor: GREY, fontSize: 12, width: 12,),
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
                            '$comment_mark Mark',
                            style: TextStyle(color: GREY[600]),
                          ),
                        )
                      ])),
              const Divider(
                thickness: 0.1,
                color: GREY,
              ),
              // -----------------
              ListMark(id: id,)
              // -----------------
            ],
          ),

        )
      ),
      bottomNavigationBar: BottomTextField(id: id,)
    );
  }
}

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


