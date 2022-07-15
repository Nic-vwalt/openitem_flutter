import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const CustomButton({Key? key, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //return a custom elevated button with a text and a leading icon
    return Center(
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return Theme.of(context).colorScheme.primary.withOpacity(0.5);
            }
            return null;
          }),
        ),
        onPressed: onTap,
        child: Row(
          children: [
            const Icon(Icons.logout,
            color: Colors.white,),
            const SizedBox(
              width: 30,
            ),
            Text(
              text,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
              
            ),
          ],
        ),
      ),
    );
  }
}
