
import 'dart:io';

import 'package:anti_fb/widgets/TextWidget.dart';
import 'package:anti_fb/widgets/icon/IconMessageWidget.dart';
import 'package:anti_fb/widgets/icon/IconSearchWidget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../constants.dart';
import '../../../widgets/ElevatedButtonWidget.dart';

class HomePage extends StatelessWidget{
  HomePage({super.key, required this.coin, required this.email});

  late String coin;
  late String email;
  @override
  Widget build(BuildContext context) {
    String coin = '10';
    String email = 'lll';
    return CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: HomeAppBarTitle(coin: coin,),
            backgroundColor: WHITE,
            floating: true,
            actions: const [
              Align(
                  alignment: Alignment.centerRight,
                  child: Row( children: [ IconSearchWidget(), IconMessageWidget() ],)
              ),
            ],
          ),

          SliverAppBar(
            backgroundColor: GREEN,
            title: const PostButton(),
            actions: [
              Container(
                padding: const EdgeInsets.only(right: 10),
                alignment: Alignment.centerRight,
                child: const Icon(Icons.image),
              )
            ]
            // snap: true,
          ),

          SliverList( delegate: SliverChildListDelegate( [const ListPostWidget()])),
        ]
    );
  }
}

class HomeAppBarTitle extends StatelessWidget {
  const HomeAppBarTitle({super.key, required this.coin});
  final String coin;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: const Text( 'Anti fb', style: TextStyle(color: CYAN, fontSize: 20, fontWeight: FontWeight.bold,),),
        ),
        Padding(
            padding: const EdgeInsets.only(left: 10), //
            child: Container(
              // padding: const EdgeInsets.only(left: 100),
                width: 100,
                decoration: BoxDecoration(
                  color : GREY,
                  border: Border.all( color: TRANSPARENT,),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextWidget(text: "Coin : $coin", fontSize: 16, textColor: YELLOW,paddingLeft: 5,)
            )
        ),
      ]
    );
  }
}

class PostButton extends StatelessWidget{
  const PostButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Container(
          width: 25, height: 25,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage('assets/images/messi-world-cup.png'), // Specify the asset path
            ),
          ),
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

      ],
    );
  }

}

// List of posts
class ListPostWidget extends StatefulWidget {

  const ListPostWidget({super.key});

  @override
  State<ListPostWidget> createState() => _ListPostWidgetState();
}

class _ListPostWidgetState extends State<ListPostWidget> {
  late List<Widget> listPosts = [];
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 10; i++) {
      listPosts.add(const PostWidget('abc@123.com','10h37', 'zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz'
          'zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz'
          'zzzzzzzzzzfdfdzzzzzzzzzdfdsfsdzzzzzzzzzzzzzzzzfsjdjhfbkjsdhfkjbsdkbfjdfsdkjfzjshdbfjhsadbfjhdzzzzzzzzzzzzz', []));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: GREY,
      child: Column( children: listPosts,)
    );
  }
}

// post
class PostWidget extends StatefulWidget {
  final String useremail;
  final String timestamp;
  final String content;
  final List<XFile> images;



  const PostWidget(this.useremail, this.timestamp, this.content, this.images, {super.key});
  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget>{
  late String useremail;
  late String timestamp;
  late String content;
  late List<XFile> images;


  late double height;
  late bool kudosChoose;
  late bool disChoose;
  @override
  void initState() {
    super.initState();
    timestamp = widget.timestamp;
    useremail = widget.useremail;
    content = widget.content;
    images = widget.images;

    height = 30;
    kudosChoose = false;
    disChoose = false;
  }
  @override
  Widget build(BuildContext context) {
    return Container (
        padding: const EdgeInsets.only(top: 5),
        child: Container(
          color: WHITE,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 50,
                  padding: const EdgeInsets.only(left:15),
                  child: Row(
                    children: [
                      Container(
                        width: 30, height: 30,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover, image: AssetImage('assets/images/messi-world-cup.png'), // Specify the asset path
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left:10),
                        child : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextWidget(text: useremail, fontSize: 14, paddingLeft: 0, width: 100,),
                            TextWidget(text: timestamp, fontSize: 14, paddingLeft: 0, width: 100,),
                          ],
                        )
                      )
                    ],
                  ),
                ),
                Container(
                  color: RED,
                  height: height,
                  child: TextWidget(text: content, fontSize: 14,),
                ),
                Container(
                  color: RED,
                  height: 30,
                  child: ElevatedButtonWidget(buttonText: 'fff', backgroundColor: GREEN, onPressed: () {
                    setState(() {
                      height = 100;
                    });
                  },),
                ),
                Container(
                  height : 100,
                  padding: const EdgeInsets.only(top: 5),
                  child: ImageDisplay(images: images,),
                ),

                Container(
                  color: ORANGE, height: 30,
                  padding: const EdgeInsets.only(left: 10),
                  child: const Row(
                    children: [
                      Row (
                        children: [
                          Icon( Icons.sentiment_satisfied_alt, color: BLUE  ,),
                          TextWidget(text: '10', textColor: BLUE ,fontSize: 10, paddingLeft: 5, width: 30,)
                        ],
                      ),
                      Row (
                        children: [
                          Icon( Icons.sentiment_dissatisfied_sharp, color: BLUE  ,),
                          TextWidget(text: '10', textColor: BLUE ,fontSize: 10, paddingLeft: 5, width: 30,)
                        ],
                      )
                    ]
                  )
                ),

                Container(
                  height : 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 10),
                        child : GestureDetector(
                          onTap: (){ setState(() {
                            if(!disChoose){ kudosChoose = !kudosChoose;}
                          });},
                          child: Row (
                            children: [
                              Icon( Icons.sentiment_satisfied_alt, color: kudosChoose ? BLUE : GREY ,),
                              TextWidget(text: 'Kudos', textColor: kudosChoose ? BLUE : GREY,fontSize: 12, paddingLeft: 5, width: 50,)
                            ],
                          ),
                        )
                      ),
                      Container(
                        child : GestureDetector(
                          onTap: (){ setState(() {
                            if(!kudosChoose){ disChoose = !disChoose;}
                          });},
                          child: Row (
                            children: [
                              Icon( Icons.sentiment_dissatisfied_sharp, color: disChoose ? BLUE : GREY ,),
                              TextWidget(text: 'Dissapoint', textColor: disChoose ? BLUE : GREY,fontSize: 12, paddingLeft: 5, width: 70,)
                            ],
                          ),
                        )
                      ),
                      Container(
                          padding: const EdgeInsets.only(right: 10),
                          child : GestureDetector(
                            onTap: (){},
                            child: const Row (
                              children: [
                                Icon( Icons.comment, color: GREY,),
                                TextWidget(text: 'Mark', textColor: GREY,fontSize: 12, paddingLeft: 5, width: 40,)
                              ],
                            ),
                          )
                      ),
                    ],
                  )
                )
              ],
            )
          )
        )
      );
  }

}

class ImageDisplay extends StatelessWidget{
  const ImageDisplay({super.key, required this.images});
  final List<XFile> images ;

  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Adjust the number of images per row as needed
            ),
            itemCount: images.length,
            itemBuilder: (context, index) {
              return Image.file(File(images[index].path));
            },
            // AssetImage('assets/images/messi-world-cup.png')
          ),
        ),
      ]
    );
  }
}



class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButtonWidget(buttonText: 'I already have an account',
            paddingTop: 10.0,
            textColor: CYAN,
            backgroundColor: WHITE,
            onPressed: () {}),
        ElevatedButtonWidget(buttonText: 'I already have an account',
            paddingTop: 10.0,
            textColor: CYAN,
            backgroundColor: WHITE,
            onPressed: () {}),ElevatedButtonWidget(buttonText: 'I already have an account',
            paddingTop: 10.0,
            textColor: CYAN,
            backgroundColor: WHITE,
            onPressed: () {}),ElevatedButtonWidget(buttonText: 'I already have an account',
            paddingTop: 10.0,
            textColor: CYAN,
            backgroundColor: WHITE,
            onPressed: () {}),ElevatedButtonWidget(buttonText: 'I already have an account',
            paddingTop: 10.0,
            textColor: CYAN,
            backgroundColor: WHITE,
            onPressed: () {}),ElevatedButtonWidget(buttonText: 'I already have an account',
            paddingTop: 10.0,
            textColor: CYAN,
            backgroundColor: WHITE,
            onPressed: () {}),ElevatedButtonWidget(buttonText: 'I already have an account',
            paddingTop: 10.0,
            textColor: CYAN,
            backgroundColor: WHITE,
            onPressed: () {}),ElevatedButtonWidget(buttonText: 'I already have an account',
            paddingTop: 10.0,
            textColor: CYAN,
            backgroundColor: WHITE,
            onPressed: () {}),ElevatedButtonWidget(buttonText: 'I already have an account',
            paddingTop: 10.0,
            textColor: CYAN,
            backgroundColor: WHITE,
            onPressed: () {}),ElevatedButtonWidget(buttonText: 'I already have an account',
            paddingTop: 10.0,
            textColor: CYAN,
            backgroundColor: WHITE,
            onPressed: () {}),ElevatedButtonWidget(buttonText: 'I already have an account',
            paddingTop: 10.0,
            textColor: CYAN,
            backgroundColor: WHITE,
            onPressed: () {}),ElevatedButtonWidget(buttonText: 'I already have an account',
            paddingTop: 10.0,
            textColor: CYAN,
            backgroundColor: WHITE,
            onPressed: () {}),ElevatedButtonWidget(buttonText: 'I already have an account',
            paddingTop: 10.0,
            textColor: CYAN,
            backgroundColor: WHITE,
            onPressed: () {}),ElevatedButtonWidget(buttonText: 'I already have an account',
            paddingTop: 10.0,
            textColor: CYAN,
            backgroundColor: WHITE,
            onPressed: () {}),ElevatedButtonWidget(buttonText: 'I already have an account',
            paddingTop: 10.0,
            textColor: CYAN,
            backgroundColor: WHITE,
            onPressed: () {}),
        ElevatedButtonWidget(buttonText: 'I already have an account',
            paddingTop: 10.0,
            textColor: CYAN,
            backgroundColor: WHITE,
            onPressed: () {}),ElevatedButtonWidget(buttonText: 'I already have an account',
            paddingTop: 10.0,
            textColor: CYAN,
            backgroundColor: WHITE,
            onPressed: () {}),ElevatedButtonWidget(buttonText: 'I already have an account',
            paddingTop: 10.0,
            textColor: CYAN,
            backgroundColor: WHITE,
            onPressed: () {}),ElevatedButtonWidget(buttonText: 'I already have an account',
            paddingTop: 10.0,
            textColor: CYAN,
            backgroundColor: WHITE,
            onPressed: () {}),ElevatedButtonWidget(buttonText: 'I already have an account',
            paddingTop: 10.0,
            textColor: CYAN,
            backgroundColor: WHITE,
            onPressed: () {}),ElevatedButtonWidget(buttonText: 'I already have an account',
            paddingTop: 10.0,
            textColor: CYAN,
            backgroundColor: WHITE,
            onPressed: () {}),ElevatedButtonWidget(buttonText: 'I already have an account',
            paddingTop: 10.0,
            textColor: CYAN,
            backgroundColor: WHITE,
            onPressed: () {}),ElevatedButtonWidget(buttonText: 'I already have an account',
            paddingTop: 10.0,
            textColor: CYAN,
            backgroundColor: WHITE,
            onPressed: () {}),ElevatedButtonWidget(buttonText: 'I already have an account',
            paddingTop: 10.0,
            textColor: CYAN,
            backgroundColor: WHITE,
            onPressed: () {}),ElevatedButtonWidget(buttonText: 'I already have an account',
            paddingTop: 10.0,
            textColor: CYAN,
            backgroundColor: WHITE,
            onPressed: () {}),ElevatedButtonWidget(buttonText: 'I already have an account',
            paddingTop: 10.0,
            textColor: CYAN,
            backgroundColor: WHITE,
            onPressed: () {}),ElevatedButtonWidget(buttonText: 'I already have an account',
            paddingTop: 10.0,
            textColor: CYAN,
            backgroundColor: WHITE,
            onPressed: () {}),ElevatedButtonWidget(buttonText: 'I already have an account',
            paddingTop: 10.0,
            textColor: CYAN,
            backgroundColor: WHITE,
            onPressed: () {}),
      ],
    );
  }
}





