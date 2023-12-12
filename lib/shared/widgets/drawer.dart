import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasky/controllers/newtasks_provider.dart';
import 'package:tasky/shared/widgets/custom_spacer.dart';
import 'package:tasky/theme/theme_manager.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<TaskProvider>(context);
    return NavigationDrawer(
      children: [
        Switch.adaptive(
            value: themeProvider.isDarkMode,
            onChanged: (newValue) {
              final provider =
                  Provider.of<TaskProvider>(context, listen: false);
              provider.toggleTheme(newValue);
            }),
        IconButton(onPressed: () {}, icon: Icon(Icons.dark_mode)),
        Text("Tasks"),
        CustomSpacer(),
        Text("2023")
      ],
    );
  }
}
