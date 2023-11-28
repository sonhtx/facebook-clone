
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
