import 'package:flutter/material.dart';
import 'package:openitem_flutter/features/visitor/services/visitor_service.dart';
import 'package:openitem_flutter/features/visitor/widgets/question_list_widget.dart';

class VisitorScreen extends StatefulWidget {
  static const String routeName = '/visitor_screen';
  const VisitorScreen({Key? key}) : super(key: key);

  @override
  State<VisitorScreen> createState() => _VisitorScreenState();
}

class _VisitorScreenState extends State<VisitorScreen> {
  final _saveVisitor = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  final VisitorService visitorService = VisitorService();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
  }

  // void saveVistor() {
  //   visitorService.saveVisitor(
  //       context: context,
  //       name: _nameController.text,
  //       );
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Visitor Workflow'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _saveVisitor,
          child: PageView(
            children: [
              QuestionListWidget(question: 'Please enter your name', controller: _nameController),
              QuestionListWidget(question: 'Please enter your email' , controller: _emailController),
            ],
          ),
        ),
      ),
    );
  }
}
