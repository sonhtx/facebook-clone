// create post bar
import 'package:flutter/material.dart';
import '../../../constants.dart';

class CreatePostButton extends StatelessWidget{
  const CreatePostButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12.0, 0, 12.0, 0.0),
      height: 50,
      color: WHITE,
      child:
          Row(
            children: [
              CircleAvatar(
                radius: 17.0,
                backgroundColor: Colors.grey[200],
                backgroundImage: const AssetImage('assets/images/messi-world-cup.png'),
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
                    onPressed: () { Navigator.pushNamed(context, '/post');},
                    child: const Text( "What's on your mind?", style: TextStyle( color: BLACK,  fontSize: 14,),),
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