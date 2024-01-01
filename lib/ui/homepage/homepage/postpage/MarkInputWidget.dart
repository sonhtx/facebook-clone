

import 'package:anti_fb/repository/post/comment_repo.dart';
import 'package:anti_fb/widgets/TextFieldWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../../../constants.dart';
import '../../../../models/comment/poster.dart';
import '../../../../models/request/ReqSetMarkComment.dart';
import 'markUI.dart';


class MarkInputWidget extends StatefulWidget {
  final String id;
  final String rateStatus;

  const MarkInputWidget({super.key, required this.id, required this.rateStatus,});

  @override
  State<MarkInputWidget> createState() => _MarkInputWidgetState();
}

class _MarkInputWidgetState extends State<MarkInputWidget> {
  late bool canRate;
  late String rateStatus;

  final TextEditingController markController = TextEditingController();
  final CommentRepository _commentRepo = CommentRepository();

  @override
  void initState(){
    super.initState();
    canRate = (widget.rateStatus == "Can rate") ? true : false;
    rateStatus = "1";
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Set mark"),
      content: Column(
        children: [
          TextFieldWidget(controller: markController,),
          Text(widget.rateStatus),
          Visibility(
            visible: canRate,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ListTile(
                  title: const Text('Trust'),
                  leading: Radio(
                    value: '1',
                    groupValue: rateStatus,
                    onChanged: (String? value) {
                      setState(() { rateStatus = value!;});
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Fake'),
                  leading: Radio(
                    value: '0',
                    groupValue: rateStatus,
                    onChanged: (String? value) {
                      setState(() { rateStatus = value!;});
                    },
                  ),
                ),

              ]
            )
          ),
        ],
      ),
      actions: [
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: WHITE, backgroundColor: BLUE, // Text color
          ),
          onPressed: () async {

            ReqSetMarkCmtData req = ReqSetMarkCmtData.withoutMarkId(widget.id,
                markController.text, "0", "10", rateStatus);

            Future<bool> status =  _commentRepo.setMarkComment(req, true) ;

            if(context.mounted){
              if(await status) {
                ScaffoldMessenger.of(context).showSnackBar(snackBarOK);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(snackBarFail);
              }
              Navigator.of(context).pop(); // Close the dialog
            }
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

final snackBarOK = SnackBar(
  content: const Text('Set mark successfully, refresh page to see your mark'),
  action: SnackBarAction(
    label: 'Undo',
    onPressed: () {
      // Some code to undo the change.
    },
  ),
);

final snackBarFail = SnackBar(
  content: const Text('Set mark unsuccessfully'),
  action: SnackBarAction(
    label: 'Undo',
    onPressed: () {
      // Some code to undo the change.
    },
  ),
);