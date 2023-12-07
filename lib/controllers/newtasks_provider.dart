import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:tasky/controllers/local_storage_repo.dart';
import 'package:tasky/models/task_model.dart';

List<Task> pendingTasks = [];
List<Task> completedTasks = [];

class TaskProvider with ChangeNotifier {
  LocalStorageRepository _localStorageRepository = LocalStorageRepository();

  List<Task> _pending = pendingTasks;
  List<Task> get myPendingTasks => _pending;

  List<Task> _completed = completedTasks;
  List<Task> get myCompletedTasks => _completed;

  getPendingTasks() async {
    Box box = await _localStorageRepository.openPbox();
    _pending = _localStorageRepository.getPendingTasks(box);
    notifyListeners();
  }

  void addToPendingList(Task task) async {
    Box box = await _localStorageRepository.openPbox();
    _localStorageRepository.addPendingTask(box, task);
    notifyListeners();
  }

  void removeFromPendingList(Task task, int index) async {
    Box box = await _localStorageRepository.openPbox();
    _localStorageRepository.removePendingTask(box, task, index);
    notifyListeners();
  }

  getCompletedTasks() async {
    Box box = await _localStorageRepository.openCbox();
    _completed = _localStorageRepository.getCompletedTasks(box);
    notifyListeners();
  }

  void addToCompletedList(Task task) async {
    Box box = await _localStorageRepository.openCbox();
    _localStorageRepository.addCompletedTask(box, task);
    notifyListeners();
  }

  void removeFromCompletedList(Task task, int index) async {
    Box box = await _localStorageRepository.openCbox();
    _localStorageRepository.removeCompletedTask(box, task, index);
    notifyListeners();
  }
}
