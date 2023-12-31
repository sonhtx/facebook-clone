

import 'package:anti_fb/repository/post/comment_repo.dart';
import 'package:anti_fb/widgets/TextFieldWidget.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';


class MarkInputWidget extends StatelessWidget {
  final String id;
  final String rateStatus;
  final TextEditingController markController = TextEditingController();

  late bool canRate;
  final CommentRepository _commentRepo = CommentRepository();

  MarkInputWidget({super.key, required this.id, required this.rateStatus,});

  @override
  Widget build(BuildContext context) {
    canRate = (rateStatus == "Can rate") ? true : false;
    return AlertDialog(
      title: const Text("Set mark"),
      content: Column(
        children: [
          TextFieldWidget(controller: markController,),
          Text(rateStatus),
          Visibility(
            visible: canRate,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text("choose rate"),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: WHITE, backgroundColor: BLUE, // Text color
          ),
          onPressed: (){

          },
          child: const Text("Mark"),
        ),
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: WHITE, backgroundColor: RED, // Text color
          ),
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: const Text("Cancel"),
        ),
      ],
    );
  }
}

