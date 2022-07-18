import 'package:hive/hive.dart';

@HiveType(typeId: 2)
class QuestionList {
  QuestionList({required this.id, required this.dateTime, required this.visitorId, required this.questions});

  @HiveField(0)
  String id;

  @HiveField(1)
  DateTime dateTime;

  @HiveField(3)
  String visitorId;

  @HiveField(4)
  Map questions;

  @override
  String toString() {
    return '$id: $visitorId';
  }
}

class QuestionListAdapter extends TypeAdapter<QuestionList> {
  @override
  final int typeId = 2;

  @override
  QuestionList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QuestionList(
      id: fields[0] as String,
      dateTime: fields[1] as DateTime,
      visitorId: fields[3] as String,
      questions: (fields[4] as Map).cast<dynamic, dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, QuestionList obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.dateTime)
      ..writeByte(3)
      ..write(obj.visitorId)
      ..writeByte(4)
      ..write(obj.questions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuestionListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}