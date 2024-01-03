// create post bar
import 'package:anti_fb/ui/homepage/homepage/createpost/createpost_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../storage.dart';

class CreatePostButton extends StatefulWidget{
  const CreatePostButton({super.key});

  @override
  State<CreatePostButton> createState() => _CreatePostButtonState();
}

class _CreatePostButtonState extends State<CreatePostButton> {
  String? imageUrl = "";
  void initState() {
    super.initState();
    getAvatarUrl().then((value) => setState(() => imageUrl = value));
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12.0, 0, 12.0, 0.0),
      height: 50,
      color: WHITE,
      child:
          Row(
            children: [
              (imageUrl != "" && imageUrl != null)
                  ? CircleAvatar(
                backgroundImage:
                CachedNetworkImageProvider(imageUrl!),
                radius: 17.0,
              )
                  : const CircleAvatar(
                backgroundImage: AssetImage(defaultAvatar),
                radius: 17.0,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(5),
                  child:  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: WHITE, // Set the background color to transparent
                      elevation: 0,
                      alignment: AlignmentDirectional.centerStart, // Align the button to the left side of the container
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () { Navigator.of(context, rootNavigator: true)
                        .push(CupertinoPageRoute(
                        builder: (context) => const CreatePostScreen()));},
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text( "What's on your mind?", style: TextStyle( color: BLACK,  fontSize: 14,),),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(right: 10),
                alignment: Alignment.centerRight,
                child: const Icon(Icons.image, color: GREEN),
              )

            ],
          )
    );
  }
}