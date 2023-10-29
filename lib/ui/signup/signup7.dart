
import 'package:anti_fb/widgets/ElevatedButtonWidget.dart';
import 'package:anti_fb/widgets/TextWidget.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';


class SignupForm7 extends StatelessWidget{
  const SignupForm7({super.key});

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [

            const TextWidget(text: 'Welcome!', fontSize: 20, textColor: CYAN,
            paddingTop: 100, textAlign: TextAlign.center,),
            const TextWidget(text: 'You have successfully signup. Please go back to login page', fontSize: 14, textColor: GREY,
              paddingTop: 10, textAlign: TextAlign.center,),
            ElevatedButtonWidget(buttonText: 'Back to login page', paddingTop: 100.0, textColor: WHITE,
                backgroundColor: CYAN,
                onPressed: (){
                  Navigator.pushNamed(context, '/login');
                }),

          ],
        )
      )

    );
  }
}










