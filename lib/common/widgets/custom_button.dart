import 'package:flutter/material.dart';
import 'package:openitem_flutter/constants/global_variables.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const CustomButton({Key? key, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //return a custom elevated button with a text and a leading icon
    return Center(
      child: FloatingActionButton.extended(
        backgroundColor: GlobalVariables.secondaryColor,
        onPressed: onTap,
        label: Text(text, style: const TextStyle(color: Colors.white,),),
        icon: const Icon(Icons.logout,
        color: Colors.white,),
      ),
    );
  }
}
