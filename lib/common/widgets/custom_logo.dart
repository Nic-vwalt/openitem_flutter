import 'package:flutter/material.dart';
import 'package:openitem_flutter/constants/global_variables.dart';

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
          color: GlobalVariables.backgroundColor,
          borderRadius: BorderRadius.circular(0),
          boxShadow: const [
            BoxShadow(
              color: GlobalVariables.backgroundColor,
              blurRadius: 10,
              offset: Offset(0, 10),
            ),
          ],
          border: Border.all(
            color: GlobalVariables.backgroundColor,
            width: 2,
          ),
          image: const DecorationImage(
            image: AssetImage('lib/assets/images/OpenItemLogo.png'),
            fit: BoxFit.fitHeight,
            colorFilter:
                ColorFilter.mode(GlobalVariables.backgroundColor, BlendMode.screen),
            opacity: 1,
          ),
        ),
      ),
    );
  }
}