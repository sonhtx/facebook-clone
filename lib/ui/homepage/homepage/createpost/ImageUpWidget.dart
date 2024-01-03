
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
    print(widget.images.length);
    return SizedBox(
      child: StaggeredGrid.count(
          crossAxisCount: 2,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
          children: [
            if (widget.images.length == 1) ...[
              StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 2,
                child: Image.file(
                    File(widget.images[0].path),
                    fit: BoxFit.cover,
                )
              )
            ] else if(widget.images.length == 2)...[
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 2,
                child: Image.file(
                  File(widget.images[0].path),
                  fit: BoxFit.cover,
                )

              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 2,
                child: Image.file(
                  File(widget.images[1].path),
                  fit: BoxFit.cover,
                )

              )
            ] else if(widget.images.length == 3) ...[
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 2,
                child:
                Image.file(
                  File(widget.images[0].path),
                  fit: BoxFit.cover,
                )

              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: Image.file(
                  File(widget.images[1].path),
                  fit: BoxFit.cover,
                )

              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child:
                Image.file(
                  File(widget.images[2].path),
                  fit: BoxFit.cover,
                )

              )
            ] else ...[
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child:
                Image.file(
                  File(widget.images[0].path),
                  fit: BoxFit.cover,
                )

              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child:
                Image.file(
                  File(widget.images[1].path),
                  fit: BoxFit.cover,
                )

              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child:
                Image.file(
                  File(widget.images[2].path),
                  fit: BoxFit.cover,
                )

              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child:
                Image.file(
                  File(widget.images[3].path),
                  fit: BoxFit.cover,
                )

              )
            ]
          ]),
    );

  }
}
