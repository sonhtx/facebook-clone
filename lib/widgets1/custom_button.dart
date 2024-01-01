import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? color;
  final IconData? icon;

  const CustomButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.color,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color, // Set the button color
      ),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(
            width: 10,
          ),
          Text(text)
        ],
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Custom Button Widget'),
        ),
        body: Center(
          child: CustomButton(
            text: 'Add friend',
            icon: Icons.person_add,
            onPressed: () {
              // Handle button press
              print('Button pressed!');
            },
            color: Colors.blue, // Set the button color here
          ),
        ),
      ),
    );
  }
}
