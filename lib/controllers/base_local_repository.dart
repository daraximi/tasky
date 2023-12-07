import 'package:hive_flutter/hive_flutter.dart';
import 'package:tasky/models/task_model.dart';

abstract class BaseLocalStorageRepository {
  Future<Box> openPbox();
  Future<Box> openCbox();
  List<Task> getPendingTasks(Box box);
  Future<void> addPendingTask(Box box, Task task);
  Future<void> removePendingTask(Box box, Task task, int index);
  List<Task> getCompletedTasks(Box box);
  Future<void> addCompletedTask(Box box, Task task);
  Future<void> removeCompletedTask(Box box, Task task, int index);
  Future<void> clearP(Box box);
  Future<void> clearC(Box box);
}
