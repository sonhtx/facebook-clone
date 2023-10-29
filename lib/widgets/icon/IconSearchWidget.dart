
import 'package:flutter/material.dart';

import '../../constants.dart';

class IconSearchWidget extends StatelessWidget {
  const IconSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.search,
        color: GREY,
      ),
      onPressed: () {
        // Add your search action here
      },
    );
  }

}
