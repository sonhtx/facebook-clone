

import 'package:anti_fb/constants.dart';
import 'package:anti_fb/data/auth/logout_api.dart';
import 'package:flutter/material.dart';

import '../../../storage.dart';
import '../../../widgets/ElevatedButtonWidget.dart';
import '../../../widgets/TextWidget.dart';
import '../home_screen.dart';

class MenuOption extends StatelessWidget{
  const MenuOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ElevatedButtonWidget(buttonText: 'Email', paddingTop: 10, textColor: BLACK, backgroundColor: GREY,
        //     onPressed: (){
        //       final HomeState? homeState = context.findAncestorStateOfType<HomeState>();
        //       homeState?.gotoPersonal();

            // }),
        ElevatedButtonWidget(buttonText: 'Change password', paddingTop: 10, textColor: BLACK, backgroundColor: GREY,
            onPressed: (){
          // Navigator.pushNamed(context, '/');
        }),
        ElevatedButtonWidget(buttonText: 'Logout', paddingTop: 10, textColor: BLACK, backgroundColor: GREY,
          onPressed: (){ _showLogoutNotification(context); }),
      ],
    );
  }
}


// logout
void _showLogoutNotification(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
          // title: const Center( child: Text('Logout'),),
        content:
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const TextWidget(text: 'Log out of your account ?', fontSize: 12),
            Row(
              children: [
                TextButton(
                  child: const Text('Cancel',style: TextStyle( color: FBBLUE),),
                  onPressed: () {
                    // Handle 'No' button action here
                    Navigator.of(context).pop(); // Close the dialog
                  },
                ),
                TextButton(
                  child: const Text('Log out',style: TextStyle( color: RED),),
                  onPressed: () async {
                    await deleteAllSecureStorageData();
                    await LogoutApi.logout();

                    if(context.mounted){
                      Navigator.pushReplacementNamed(context, '/login');
                    }
                  },
                ),
              ],
            )
          ],
        )
      );
    },
  );
}

