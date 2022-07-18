import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:openitem_flutter/models/hive/question_list.dart';
import 'package:openitem_flutter/models/hive/visitor.dart';
import 'package:path_provider/path_provider.dart';

class VisitorService{
  void saveVisitor({
    required BuildContext context,
    required String id,
    required String name,
    required String surname,
    required String phone,
  }) async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String path = appDocDir.path;
    Hive
      ..init(path)
      ..registerAdapter(VisitorAdapter());

    var box = await Hive.openBox('VisitorBox');

    var visitor = Visitor(
      id: id,
      name: name,
      surname: surname,
      phone: phone,
      lastEntryDate: DateTime.now(),
    );

    await box.put(id, visitor);

    print(box.get(id));
  }

  void saveQuestions({
    required BuildContext context,
    required String id,
    required String visitorId,
    required Map questions,
  }) async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String path = appDocDir.path;
    Hive
      ..init(path)
      ..registerAdapter(QuestionListAdapter());

    var box = await Hive.openBox('QuestionListsBox');

    var ql = QuestionList(
      id: id,
      dateTime: DateTime.now(),
      visitorId: visitorId,
      questions: questions,
    );

    await box.put(id, ql);

    print(box.get(id));
  }

}

