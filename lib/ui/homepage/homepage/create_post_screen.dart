
import 'dart:io';

import 'package:anti_fb/models/post/CreatePostData.dart';
import 'package:anti_fb/widgets/TextWidget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../constants.dart';
import '../../../storage.dart';


class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  late CreatePostData createPostData;

  late Color postButtonBackgroundColor;

  TextEditingController textController = TextEditingController();
  ValueNotifier<List<XFile>> imagesNotifier = ValueNotifier<List<XFile>>([]);

  @override
  void initState() {
    super.initState();
    createPostData = CreatePostData(0, null, '', [], null);
    postButtonBackgroundColor = GREY;
    textController.addListener(() {
      setState(() {
        if (textController.text != '' || createPostData.images != []) {
          postButtonBackgroundColor = CYAN; // Change button color
        } else {
          postButtonBackgroundColor = GREY; // Reset button color
        }
      });
    });
  }

  Future<void> pickImages() async {
    final ImagePicker picker = ImagePicker();

    // Open the image picker to select multiple images
    final List<XFile> pickedImages = await picker.pickMultiImage();

    createPostData.images = pickedImages;
    imagesNotifier.value = pickedImages;
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          backgroundColor: WHITE, // Set the background color to white
          elevation: 1.0, // Add a small elevation (shadow) to create a tiny line at the bottom
          automaticallyImplyLeading: false, // Hide the default back button
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon( Icons.close,  color: BLACK ),
                onPressed: () { _showDiscardNotification(context);},
              ),
                  // const SizedBox(width: 8), // Add some spacing between the close icon and title
              const Center( child: Text('Create post',style: TextStyle( color: BLACK,),),),
              TextButton(
                style: TextButton.styleFrom( backgroundColor: postButtonBackgroundColor, ),
                child: const Text( "Post", style: TextStyle(color: BLACK),),
                onPressed: () async {
                  int? id = (await getId()) as int?;
                  createPostData.userid = id!;
                  createPostData.content = textController.text;
                  createPostData.timestamp = DateTime.timestamp();

                  // send create post request, need jwt

                },
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column (
            children: <Widget>[
              Container(
                padding :const EdgeInsets.only(), width: double.infinity, height: 50,
                child:
                  Container(
                    padding: const EdgeInsets.only(left: 100),
                    child: IconButton(
                      icon: const Icon( Icons.image,),
                      onPressed: () async { await pickImages();},
                    )
                  )
              ),
              Container(
                padding :const EdgeInsets.only(left: 5),
                height: 200, // Set a height constraint
                width: double.infinity,
                child : Column (
                  children: [
                    Expanded(
                      child: TextField(
                      maxLines: null,
                      decoration: InputDecoration(
                        // contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                        hintText : "What's on your mind ?",
                        hintStyle: TextStyle( color: GREY.shade400,),
                        border: InputBorder.none, // Remove the underline
                      ),
                      controller: textController,
                      // obscureText: obscureText,
                      )
                    )
                  ]
                )
              ),

              Container(
                height: 300,
                padding :const EdgeInsets.only(left: 5),
                child: ValueListenableBuilder<List<XFile>>(
                    valueListenable: imagesNotifier, // Listen to changes in images
                    builder: (context, images, _) {
                      return ImageUploadWidget(images: images); // Pass the images to the widget
                    },
                  ),
                )
            ]
          )
        )
    );
  }
}


class ImageUploadWidget extends StatefulWidget {
  final List<XFile> images;
  const ImageUploadWidget({required this.images, Key? key}) : super(key: key);

  @override
  State<ImageUploadWidget> createState() => _ImageUploadWidgetState();
}

class _ImageUploadWidgetState extends State<ImageUploadWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Adjust the number of images per row as needed
            ),
            itemCount: widget.images.length,
            itemBuilder: (context, index) {
              return Image.file(File(widget.images[index].path));
            },
              // AssetImage('assets/images/messi-world-cup.png')
          ),
        ),

      ],
    );
  }
}

void _showDiscardNotification(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Center( child: Text('Quit posting'),),
        content:
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const TextWidget(text: 'If you quit, the discard will not be save', fontSize: 12),
              TextButton(
                child: const Text('Quit'),
                onPressed: () {
                  // Navigator.pushReplacementNamed(context, '/home');
                  Navigator.popUntil(context, ModalRoute.withName('/home'));
                },
              ),
              TextButton(
                child: const Text('Keep editing'),
                onPressed: () {
                  // Handle 'No' button action here
                  Navigator.of(context).pop(); // Close the dialog
                },
              ),
            ],
          )
      );
    },
  );
}





