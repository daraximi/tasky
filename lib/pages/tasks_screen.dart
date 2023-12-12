import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/pages/completed_tasks.dart';
import 'package:tasky/pages/pending_tasks.dart';
import 'package:tasky/shared/widgets/drawer.dart';
import 'package:tasky/shared/widgets/pending_task_widget.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  bool changeScreen = true;
  _changeScreen() {
    changeScreen = !changeScreen;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          drawer: CustomDrawer(),
          appBar: AppBar(
            elevation: 0,
            actions: [
              IconButton(
                  iconSize: 28,
                  onPressed: () => _changeScreen(),
                  icon: Icon(changeScreen ? Icons.done : Icons.pending))
            ],
            title: const Text('Tasks'),
          ),
          backgroundColor: Theme.of(context).colorScheme.background,
          body: changeScreen ? PendingTasks() : CompletedTasks()),
    );
  }
}
