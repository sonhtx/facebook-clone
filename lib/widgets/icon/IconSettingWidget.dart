
import 'package:flutter/material.dart';

import '../../constants.dart';

class IconSettingWidget extends StatelessWidget {
  const IconSettingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.settings,
        color: GREY,
      ),
      onPressed: () {
        // Add your search action here
      },
    );
  }

}
