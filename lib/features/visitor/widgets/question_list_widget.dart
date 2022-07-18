import 'package:flutter/material.dart';
import 'package:openitem_flutter/common/widgets/custom_textfield.dart';

class QuestionListWidget extends StatelessWidget {
  final String question;
  final TextEditingController controller;
  const QuestionListWidget({Key? key, required this.question, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(question,
          style: const TextStyle(
          fontSize: 20,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: CustomTextField(controller: controller, hintText: question),
        )
      ],
    );
  }
}