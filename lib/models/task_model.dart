
import 'package:hive/hive.dart';
part 'task_model.g.dart';

@HiveType(typeId: 0)
class Task {
  @HiveField(0)
  final String task;
  @HiveField(1)
  final bool completed;

  Task({required this.task, required this.completed});
}
