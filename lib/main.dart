import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tasky/controllers/newtasks_provider.dart';
import 'package:tasky/controllers/tasks_provider.dart';
import 'package:tasky/models/task_model.dart';
import 'package:tasky/pages/auth/login.dart';
import 'package:tasky/pages/tasks_screen.dart';
import 'package:tasky/theme/theme_constants.dart';
import 'package:tasky/theme/theme_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  runApp(ChangeNotifierProvider<TaskProvider>(
    child: const MyApp(),
    create: (_) => TaskProvider(),
  ));
}

ThemeManager _themeManager = ThemeManager();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        final themeProvider = Provider.of<TaskProvider>(context);
        themeProvider.getTheme();
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Tasky',
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: themeProvider.themeMode,
          home: const TasksScreen(),
        );
      },
    );
  }
}
