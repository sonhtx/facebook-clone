import 'package:anti_fb/models/post/CreatePostData.dart';
import 'package:anti_fb/widget_dung/videoImportWidget.dart';
import 'package:anti_fb/widgets/TextWidget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../api/post/multimediaPost_api.dart';
import '../../../../constants.dart';
import 'ImageUpWidget.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  late CreatePostData createPostData;

  late Color postButtonBackgroundColor;

  final AddPostApi _addPostApi = AddPostApi();

  TextEditingController textController = TextEditingController();
  ValueNotifier<List<XFile>> imagesNotifier = ValueNotifier<List<XFile>>([]);
  ValueNotifier<XFile> videoNotifier = ValueNotifier<XFile>(XFile(''));

  @override
  void initState() {
    super.initState();
    createPostData = CreatePostData();
    postButtonBackgroundColor = GREY;
    textController.addListener(() {
      setState(() {
        if (textController.text != '' || createPostData.images != []) {
          postButtonBackgroundColor = FBBLUE; // Change button color
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
    if(pickedImages != null){
      createPostData.images = pickedImages;
      imagesNotifier.value = pickedImages;
      createPostData.video = null;
      videoNotifier.value = XFile('');
    }
  }

  Future<void> pickVideo() async {
    final ImagePicker picker = ImagePicker();

    // Open the image picker to select multiple images
    final XFile? pickedVideo =
        await picker.pickVideo(source: ImageSource.gallery);

    if(pickedVideo!= null){
      createPostData.video = pickedVideo;
      videoNotifier.value = pickedVideo;
      createPostData.images = null;
      imagesNotifier.value = [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: WHITE,
          // Set the background color to white
          elevation: 1.0,
          // Add a small elevation (shadow) to create a tiny line at the bottom
          automaticallyImplyLeading: false,
          // Hide the default back button
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.close, color: BLACK),
                onPressed: () {
                  _showDiscardNotification(context);
                },
              ),
              // const SizedBox(width: 8), // Add some spacing between the close icon and title
              const Center(
                child: Text(
                  'Create post',
                  style: TextStyle(
                    color: BLACK,
                  ),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: postButtonBackgroundColor,
                ),
                child: const Text(
                  "Post",
                  style: TextStyle(color: WHITE),
                ),
                onPressed: () async {
                  createPostData.described = textController.text;
                  createPostData.status = "Hyped";
                  createPostData.auto_accept = "1";
                  // send create post request, need jwt
                  showLoaderDialog(context, "Loading");
                  await _addPostApi.addPost(createPostData);
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Success'),
                  ));
                  Navigator.pop(context);

                },
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                child: SingleChildScrollView(
                  child:
                      Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    Container(
                        padding: const EdgeInsets.all(10),
                        width: double.infinity,
                        height: 70,
                        child: Row(children: [
                          const TextWidget(
                            text: 'Choose images',
                            fontSize: 12,
                            width: 100,
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.image,
                            ),
                            onPressed: () async {
                              await pickImages();
                            },
                          )
                        ])),
                    Container(
                        padding: const EdgeInsets.all(10),
                        width: double.infinity,
                        height: 70,
                        child: Row(children: [
                          const TextWidget(
                            text: 'Choose video',
                            fontSize: 12,
                            width: 100,
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.video_file,
                            ),
                            onPressed: () async {
                              await pickVideo();
                            },
                          )
                        ])),
                    Container(
                        padding: const EdgeInsets.only(left: 5),
                        width: double.infinity,
                        child: Column(children: [
                          TextField(
                            maxLines: null,
                            decoration: InputDecoration(
                              // contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                              hintText: "What's on your mind ?",
                              hintStyle: TextStyle(
                                color: GREY.shade400,
                              ),
                              border: InputBorder.none, // Remove the underline
                            ),
                            controller: textController,
                            // obscureText: obscureText,
                          )
                        ])),
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: ValueListenableBuilder<List<XFile>>(
                        valueListenable: imagesNotifier,
                        // Listen to changes in images
                        builder: (context, images, _) {
                          if (images.isNotEmpty) {
                            return ImageUploadWidget(images: images);
                          } else {
                            return Container();
                          }
                          // Pass the images to the widget
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: ValueListenableBuilder<XFile?>(
                        valueListenable: videoNotifier,
                        builder: (context, videoFile, _) {
                          if(videoFile!=null){
                            print(videoFile!.path);
                          }
                          if (videoFile!.path.isEmpty) {
                            return Container();
                          } else {
                            // return Text('1 video selected.');
                            return videoImportPlayerWidget(url: videoFile!.path);
                            // return VideoPlayerWidget(videoFile: videoFile);
                          }
                        },
                      ),
                    )
                  ]),
                ),
              ),
            ),
          ],
        ));
  }
}

// alert dialog
void _showDiscardNotification(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
          title: const Center(
            child: Text('Quit posting'),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const TextWidget(
                  text: 'If you quit, the discard will not be save',
                  fontSize: 12),
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
          ));
    },
  );
}
