

import 'package:anti_fb/widget_dung/imageViewWidget.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
    TextEditingController commentController = TextEditingController();

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
              Text(described),
              (images.isNotEmpty)
                  ? 
                  ImageWidget(images: images)
              // SizedBox(
              //     height: 200 ,
              //     child: GridView.builder(
              //       gridDelegate:
              //       const SliverGridDelegateWithFixedCrossAxisCount(
              //         crossAxisCount:
              //         2, // Adjust the number of images per row as needed
              //       ),
              //       itemCount: images.length,
              //       itemBuilder: (context, index) {
              //         return ListTile(
              //           title: CachedNetworkImage(
              //             imageUrl: images[index].url,
              //             placeholder: (context, url) =>
              //             const CircularProgressIndicator(),
              //             errorWidget: (context, url, error) =>
              //             const Icon(Icons.error),
              //           ),
              //         );
              //       },
              //     ))
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
      bottomNavigationBar: Container(
        color: WHITE,
        height: 50,
        child: Row(
          children: [
            TextField(controller: commentController,
              decoration: const InputDecoration(
                hintText: 'Comment',
              ),),

          ],
        )


      ),
    
    );
  }
}




