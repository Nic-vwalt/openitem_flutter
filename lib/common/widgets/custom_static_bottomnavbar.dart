import 'package:flutter/material.dart';

class BottomNavbarLogo extends StatelessWidget {
  const BottomNavbarLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.black,
        borderRadius: BorderRadius.circular(0),
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
          image: AssetImage('lib/assets/images/wyobi.png'),
          fit: BoxFit.fitHeight,
          colorFilter:
              ColorFilter.mode(Colors.black, BlendMode.screen),
          opacity: 1,
        ),
      ),
    );
  }
}