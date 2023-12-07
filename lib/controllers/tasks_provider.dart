import 'package:flutter/material.dart';
import 'package:tasky/models/task_model.dart';

List<Task> pendingTasks = [];
List<Task> completedTasks = [];

class TaskProvider with ChangeNotifier {
  final List<Task> _pending = pendingTasks;
  List<Task> get myPendingTasks => _pending;

  final List<Task> _completed = completedTasks;
  List<Task> get myCompletedTasks => _completed;

  void addToPendingList(Task task) {
    _pending.add(task);
    notifyListeners();
  }

  void removeFromPendingList(Task task, int index) {
    _pending.removeAt(index);
    notifyListeners();
  }

  void addToCompletedList(Task task) {
    _completed.add(task);
    notifyListeners();
  }

  void removeFromCompletedList(Task task, int index) {
    _completed.removeAt(index);
    notifyListeners();
  }
}
