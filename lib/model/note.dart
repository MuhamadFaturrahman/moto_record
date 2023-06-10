import 'package:hive/hive.dart';
part 'note.g.dart';

@HiveType(typeId: 0)
class Note extends HiveObject {
  @HiveField(0)
  late String title;
  @HiveField(1)
  late String description;
  @HiveField(2)
  late String type;
  @HiveField(3)
  late int odometer;
  @HiveField(4)
  late double serviceFee;
  @HiveField(5)
  late DateTime createdAt;

  Note(
    this.title,
    this.description,
    this.type,
    this.odometer,
    this.serviceFee,
    this.createdAt,
  );
}
