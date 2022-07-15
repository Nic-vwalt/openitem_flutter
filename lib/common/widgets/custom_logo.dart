import 'package:flutter/material.dart';

class OpenitemLogo extends StatelessWidget {
  const OpenitemLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: 70,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.black,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              blurRadius: 10,
              offset: Offset(0, 10),
            ),
          ],
          border: Border.all(
            color: Colors.grey,
            width: 2,
          ),
          image: const DecorationImage(
            image: AssetImage('lib/assets/images/OpenItemLogo.png'),
            fit: BoxFit.fitHeight,
            colorFilter:
                ColorFilter.mode(Colors.black, BlendMode.screen),
            opacity: 1,
          ),
        ),
      ),
    );
  }
}