
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
                // CachedNetworkImage(
                //   imageUrl: images[0].url,
                //   imageBuilder: (context, imageProvider) => Container(
                //     decoration: BoxDecoration(
                //       image: DecorationImage(
                //         image: imageProvider,
                //         fit: BoxFit.cover,
                //       ),
                //     ),
                //   ),
                //   placeholder: (context, url) =>const Center(
                //     child: SizedBox(
                //         height: 20,
                //         width: 20,
                //         child: CircularProgressIndicator()
                //     ),
                //   ),
                //   errorWidget: (context, url, error) => const Icon(Icons.error),
                // ),
              )
            ] else if(widget.images.length == 2)...[
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 2,
                child: Image.file(
                  File(widget.images[0].path),
                  fit: BoxFit.cover,
                )
                // CachedNetworkImage(
                //   imageUrl: images[0].url,
                //   imageBuilder: (context, imageProvider) => Container(
                //     decoration: BoxDecoration(
                //       image: DecorationImage(
                //         image: imageProvider,
                //         fit: BoxFit.cover,
                //       ),
                //     ),
                //   ),
                //   placeholder: (context, url) =>const Center(
                //     child: SizedBox(
                //         height: 20,
                //         width: 20,
                //         child: CircularProgressIndicator()
                //     ),
                //   ),
                //   errorWidget: (context, url, error) => const Icon(Icons.error),
                // ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 2,
                child: Image.file(
                  File(widget.images[1].path),
                  fit: BoxFit.cover,
                )
                // CachedNetworkImage(
                //   imageUrl: images[1].url,
                //   imageBuilder: (context, imageProvider) => Container(
                //     decoration: BoxDecoration(
                //       image: DecorationImage(
                //         image: imageProvider,
                //         fit: BoxFit.cover,
                //       ),
                //     ),
                //   ),
                //   placeholder: (context, url) =>const Center(
                //     child: SizedBox(
                //         height: 20,
                //         width: 20,
                //         child: CircularProgressIndicator()
                //     ),
                //   ),
                //   errorWidget: (context, url, error) => const Icon(Icons.error),
                // ),
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
                // CachedNetworkImage(
                //   imageUrl: images[0].url,
                //   imageBuilder: (context, imageProvider) => Container(
                //     decoration: BoxDecoration(
                //       image: DecorationImage(
                //         image: imageProvider,
                //         fit: BoxFit.cover,
                //       ),
                //     ),
                //   ),
                //   placeholder: (context, url) =>
                //   const Center(
                //     child: SizedBox(
                //         height: 20,
                //         width: 20,
                //         child: CircularProgressIndicator()
                //     ),
                //   ),
                //   errorWidget: (context, url, error) => const Icon(Icons.error),
                // ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: Image.file(
                  File(widget.images[1].path),
                  fit: BoxFit.cover,
                )
                // CachedNetworkImage(
                //   imageUrl: images[1].url,
                //   imageBuilder: (context, imageProvider) => Container(
                //     decoration: BoxDecoration(
                //       image: DecorationImage(
                //         image: imageProvider,
                //         fit: BoxFit.cover,
                //       ),
                //     ),
                //   ),
                //   placeholder: (context, url) =>
                //   const Center(
                //     child: SizedBox(
                //         height: 20,
                //         width: 20,
                //         child: CircularProgressIndicator()
                //     ),
                //   ),
                //   errorWidget: (context, url, error) => const Icon(Icons.error),
                // ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child:
                Image.file(
                  File(widget.images[2].path),
                  fit: BoxFit.cover,
                )
                // CachedNetworkImage(
                //   imageUrl: images[2].url,
                //   imageBuilder: (context, imageProvider) => Container(
                //     decoration: BoxDecoration(
                //       image: DecorationImage(
                //         image: imageProvider,
                //         fit: BoxFit.cover,
                //       ),
                //     ),
                //   ),
                //   placeholder: (context, url) =>
                //   const Center(
                //     child: SizedBox(
                //         height: 20,
                //         width: 20,
                //         child: CircularProgressIndicator()
                //     ),
                //   ),
                //   errorWidget: (context, url, error) => const Icon(Icons.error),
                // ),
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
                // CachedNetworkImage(
                //   imageUrl: images[0].url,
                //   imageBuilder: (context, imageProvider) => Container(
                //     decoration: BoxDecoration(
                //       image: DecorationImage(
                //         image: imageProvider,
                //         fit: BoxFit.cover,
                //       ),
                //     ),
                //   ),
                //   placeholder: (context, url) =>
                //   const Center(
                //     child: SizedBox(
                //         height: 20,
                //         width: 20,
                //         child: CircularProgressIndicator()
                //     ),
                //   ),
                //   errorWidget: (context, url, error) => const Icon(Icons.error),
                // ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child:
                Image.file(
                  File(widget.images[1].path),
                  fit: BoxFit.cover,
                )
                // CachedNetworkImage(
                //   imageUrl: images[1].url,
                //   imageBuilder: (context, imageProvider) => Container(
                //     decoration: BoxDecoration(
                //       image: DecorationImage(
                //         image: imageProvider,
                //         fit: BoxFit.cover,
                //       ),
                //     ),
                //   ),
                //   placeholder: (context, url) =>
                //   const Center(
                //     child: SizedBox(
                //         height: 20,
                //         width: 20,
                //         child: CircularProgressIndicator()
                //     ),
                //   ),
                //   errorWidget: (context, url, error) => const Icon(Icons.error),
                // ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child:
                Image.file(
                  File(widget.images[2].path),
                  fit: BoxFit.cover,
                )
                // CachedNetworkImage(
                //   imageUrl: images[2].url,
                //   imageBuilder: (context, imageProvider) => Container(
                //     decoration: BoxDecoration(
                //       image: DecorationImage(
                //         image: imageProvider,
                //         fit: BoxFit.cover,
                //       ),
                //     ),
                //   ),
                //   placeholder: (context, url) =>
                //   const Center(
                //     child: SizedBox(
                //         height: 20,
                //         width: 20,
                //         child: CircularProgressIndicator()
                //     ),
                //   ),
                //   errorWidget: (context, url, error) => const Icon(Icons.error),
                // ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child:
                Image.file(
                  File(widget.images[3].path),
                  fit: BoxFit.cover,
                )
                // CachedNetworkImage(
                //   imageUrl: images[3].url,
                //   imageBuilder: (context, imageProvider) => Container(
                //     decoration: BoxDecoration(
                //       image: DecorationImage(
                //         image: imageProvider,
                //         fit: BoxFit.cover,
                //       ),
                //     ),
                //   ),
                //   placeholder: (context, url) =>
                //   const Center(
                //     child: SizedBox(
                //         height: 20,
                //         width: 20,
                //         child: CircularProgressIndicator()
                //     ),
                //   ),
                //   errorWidget: (context, url, error) => const Icon(Icons.error),
                // ),
              )
            ]
          ]),
    );
    //   Column(
    //   children:[
    //     Expanded(
    //       child: GridView.builder(
    //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //           crossAxisCount: 2, // Adjust the number of images per row as needed
    //         ),
    //         itemCount: widget.images.length,
    //         itemBuilder: (context, index) {
    //           return Image.file(File(widget.images[index].path));
    //         },
    //         // AssetImage('assets/images/messi-world-cup.png')
    //       ),
    //     ),
    //
    //   ],
    // );
  }
}
