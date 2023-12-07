import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tasky/controllers/tasks_provider.dart';
import 'package:tasky/models/task_model.dart';

class CompletedTask extends StatefulWidget {
  const CompletedTask({super.key, required this.task, required this.index});
  final String task;
  final int index;
  @override
  State<CompletedTask> createState() => _CompletedTaskState();
}

class _CompletedTaskState extends State<CompletedTask> {
  @override
  Widget build(BuildContext context) {
    var pendingTasks = context.watch<TaskProvider>().myCompletedTasks;

    return Container(
      padding: EdgeInsets.all(4.w),
      height: 40.h,
      width: 344.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.task,
            style: TextStyle(
                color: Colors.grey,
                fontSize: 15.h,
                decoration: TextDecoration.lineThrough),
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Task task = Task(task: widget.task, completed: false);

                    Future.delayed(Duration(milliseconds: 300)).then((value) {
                      context.read<TaskProvider>().addToPendingList(task);
                      context
                          .read<TaskProvider>()
                          .removeFromCompletedList(task, widget.index);
                    });
                  },
                  icon: Icon(Icons.pending_actions)),
              IconButton(
                  onPressed: () {
                    Future.delayed(Duration(milliseconds: 200)).then((value) {
                      Task task = Task(task: widget.task, completed: false);
                      context
                          .read<TaskProvider>()
                          .removeFromCompletedList(task, widget.index);
                    });
                  },
                  icon: Icon(Icons.delete))
            ],
          )
        ],
      ),
    );
  }
}
