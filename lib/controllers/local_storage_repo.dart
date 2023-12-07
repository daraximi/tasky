import 'package:hive_flutter/hive_flutter.dart';
import 'package:tasky/controllers/base_local_repository.dart';
import 'package:tasky/models/task_model.dart';

class LocalStorageRepository extends BaseLocalStorageRepository {
  String pendingDbName = "pendingDb";
  String completedDbName = "completedDb";
  @override
  Future<Box> openPbox() async {
    Box box = await Hive.openBox<Task>(pendingDbName);
    return box;
  }

  @override
  Future<Box> openCbox() async {
    Box box = await Hive.openBox<Task>(completedDbName);
    return box;
  }

  @override
  List<Task> getPendingTasks(Box box) {
    return box.values.toList() as List<Task>;
  }
  //pending
  @override
  Future<void> addPendingTask(Box box, Task task) async{
    await box.add(task);
  }

  @override
  Future<void> removePendingTask(Box box, Task task, int index)async {
    await box.deleteAt(index);
  }
  //completed
  @override
  List<Task> getCompletedTasks(Box box) {
    return box.values.toList() as List<Task>;
  }

  @override
  Future<void> addCompletedTask(Box box, Task task)async {
    await box.add(task);
  }

  @override
  Future<void> removeCompletedTask(Box box, Task task, int index) async{
    await box.deleteAt(index);
  }

  @override
  Future<void> clearP(Box box) async{
    await box.clear();
  }
  @override
  Future<void> clearC(Box box) async{
    await box.clear();
  }
}
