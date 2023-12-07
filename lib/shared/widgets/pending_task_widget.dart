import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tasky/controllers/tasks_provider.dart';
import 'package:tasky/models/task_model.dart';

class PendingTask extends StatefulWidget {
  const PendingTask({super.key, required this.task, required this.index});
  final String task;
  final int index;

  @override
  State<PendingTask> createState() => _PendingTaskState();
}

class _PendingTaskState extends State<PendingTask> {
  @override
  Widget build(BuildContext context) {
    var pendingTasks = context.watch<TaskProvider>().myPendingTasks;
    bool pending = false;

    return Container(
      padding: EdgeInsets.all(2),
      height: 40.h,
      width: 344.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.task,
            style: TextStyle(color: Colors.black, fontSize: 14.h),
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Task task = Task(task: widget.task, completed: false);
                    Task ctask = Task(task: widget.task, completed: true);
                    setState(() {
                      pending = true;
                    });
                    context.read<TaskProvider>().addToCompletedList(ctask);
                    Future.delayed(Duration(milliseconds: 300)).then((value) {
                      context
                          .read<TaskProvider>()
                          .removeFromPendingList(task, widget.index);
                    });
                  },
                  icon: Icon(pending
                      ? Icons.check_box
                      : Icons.check_box_outline_blank)),
              IconButton(
                  onPressed: () {
                    Task task = Task(task: widget.task, completed: false);
                    Future.delayed(Duration(milliseconds: 200)).then((value) {
                      context
                          .read<TaskProvider>()
                          .removeFromPendingList(task, widget.index);
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
