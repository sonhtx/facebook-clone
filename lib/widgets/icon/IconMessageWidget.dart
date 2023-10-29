


import 'package:flutter/material.dart';

import '../../constants.dart';

class IconMessageWidget extends StatelessWidget {
  const IconMessageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.message,
        color: GREY,
      ),
      onPressed: () {
        // Add your search action here
      },
    );
  }

}
