import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tasky/controllers/newtasks_provider.dart';
import 'package:tasky/controllers/tasks_provider.dart';
import 'package:tasky/models/task_model.dart';
import 'package:tasky/shared/widgets/pending_task_widget.dart';

class PendingTasks extends StatefulWidget {
  const PendingTasks({super.key});

  @override
  State<PendingTasks> createState() => _PendingTasksState();
}

class _PendingTasksState extends State<PendingTasks> {
  TextEditingController taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var pendingTasks = context.watch<TaskProvider>().myPendingTasks;
    var notifier = Provider.of<TaskProvider>(context);
    notifier.getPendingTasks();
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 8, right: 8, bottom: 0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Positioned(
                top: 0.h,
                child: Container(
                  decoration: BoxDecoration(
                      color:
                          Theme.of(context).secondaryHeaderColor.withAlpha(90),
                      borderRadius: BorderRadius.circular(40)),
                  padding: EdgeInsets.all(2.h),
                  height: 50.h,
                  width: 345.w,
                  child: TextFormField(
                    controller: taskController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        suffix: CircleAvatar(
                          radius: 16.r,
                          child: IconButton(
                            iconSize: 12.r,
                            onPressed: () {
                              if (taskController.text.isNotEmpty) {
                                Task task = Task(
                                    completed: false,
                                    task: taskController.text.trim());
                                context
                                    .read<TaskProvider>()
                                    .addToPendingList(task);
                                taskController.clear();
                              }
                            },
                            icon: Icon(Icons.done),
                          ),
                        ),
                        hintText: "Enter new task",
                        fillColor: Colors.black,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor))),
                  ),
                )),
            Positioned(
              top: 60.h,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20)),
                height: 540.h,
                width: 345.w,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: pendingTasks.length,
                  itemBuilder: (context, index) {
                    var singleTask = pendingTasks[index];

                    return PendingTask(task: singleTask.task, index: index);
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
