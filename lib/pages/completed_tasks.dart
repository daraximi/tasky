import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tasky/controllers/tasks_provider.dart';
import 'package:tasky/shared/widgets/completed_task_widget.dart';
import 'package:tasky/shared/widgets/pending_task_widget.dart';

class CompletedTasks extends StatefulWidget {
  const CompletedTasks({super.key});

  @override
  State<CompletedTasks> createState() => _CompletedTasksState();
}

class _CompletedTasksState extends State<CompletedTasks> {
  @override
  Widget build(BuildContext context) {
    var completedTasks = context.watch<TaskProvider>().myCompletedTasks;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Positioned(
              top: 2.h,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20)),
                height: 300.h,
                width: 345.w,
                child: ListView.builder(
                  itemCount: completedTasks.length,
                  itemBuilder: (context, index) {
                    var singleCompletedTask = completedTasks[index];
                    return CompletedTask(
                      task: singleCompletedTask.task,
                      index: index,
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
