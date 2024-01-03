import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class videoImportPlayerWidget extends StatefulWidget {
  final String url;
  const videoImportPlayerWidget({super.key, required this.url});

  @override
  State<videoImportPlayerWidget> createState() => _videoImportPlayerWidgetState();
}

class _videoImportPlayerWidgetState extends State<videoImportPlayerWidget> {

  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.file(File(widget.url));
    // _chewieController = ChewieController(
    //   videoPlayerController: _videoPlayerController,
    //   aspectRatio: 16 / 9, // adjust as needed
    //   autoInitialize: true,
    //   looping: true, // set to false if you don't want the video to loop
    // );
    _videoPlayerController.initialize().then(
        (_)=> setState(
            () => _chewieController = ChewieController(
                videoPlayerController: _videoPlayerController,
              aspectRatio: _videoPlayerController.value.aspectRatio
            )
        )
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return _videoPlayerController.value.isInitialized?
      AspectRatio(
      aspectRatio: _videoPlayerController.value.aspectRatio,
      child: Chewie(
        controller: _chewieController,
      ),
    ):
    const SizedBox.shrink();
  }
}
