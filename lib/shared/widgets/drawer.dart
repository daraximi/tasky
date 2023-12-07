import 'package:flutter/material.dart';
import 'package:tasky/shared/widgets/custom_spacer.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return const NavigationDrawer(
      backgroundColor: Colors.white,
      children: [Text("Tasks"), CustomSpacer(), Text("Logout")],
    );
  }
}
