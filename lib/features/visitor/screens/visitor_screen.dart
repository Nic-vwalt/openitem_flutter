import 'package:flutter/material.dart';
import 'package:openitem_flutter/features/visitor/widgets/question_list_widget.dart';

class VisitorScreen extends StatelessWidget {
  static const String routeName = '/visitor_screen';
  const VisitorScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Visitor Workflow'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PageView(
          children: [
            QuestionListWidget(question: 'Please enter your name', controller: nameController),
            QuestionListWidget(question: 'Please enter your email' , controller: emailController),
          ],
        ),
      ),
    );
  }
}
