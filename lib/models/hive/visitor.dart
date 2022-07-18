import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class Visitor {
  Visitor({
    required this.id,
    required this.name,
    required this.surname,
    required this.phone,
    required this.lastEntryDate,
  });

  @HiveField(0)
  String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String surname;

  @HiveField(3)
  String phone;

  @HiveField(4)
  DateTime lastEntryDate;

  @override
  String toString() {
    return '$name: $id';
  }
}

class VisitorAdapter extends TypeAdapter<Visitor> {
  @override
  final int typeId = 1;

  @override
  Visitor read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Visitor(
      id: fields[0] as String,
      name: fields[1] as String,
      surname: fields[2] as String,
      phone: fields[3] as String,
      lastEntryDate: fields[4] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Visitor obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.surname)
      ..writeByte(3)
      ..write(obj.phone)
      ..writeByte(4)
      ..write(obj.lastEntryDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VisitorAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}