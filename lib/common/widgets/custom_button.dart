import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const CustomButton({Key? key, required this.text, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //return a custom elevated button with a text and a leading icon
    return ElevatedButton(
      onPressed: onTap,
      child: Row(
        children: [
          const Icon(Icons.add),
          const SizedBox(width: 10),
          Text(text,),
        ],
      ),
    );
  }
}
