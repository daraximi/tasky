import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/shared/widgets/custom_spacer.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(vertical: 90.h, horizontal: 12.w),
      child: Column(
        children: [
          TextFormField(
            maxLength: 25,
            maxLines: 1,
            controller: emailController,
            decoration: const InputDecoration(
                helperStyle: TextStyle(color: Colors.transparent),
                hintText: "Enter username"),
          ),
          // TextFormField(
          //   maxLength: 25,
          //   maxLines: 1,
          //   controller: emailController,
          //   decoration: const InputDecoration(hintText: "Enter email"),
          // ),
          // TextFormField(
          //   maxLength: 25,
          //   maxLines: 1,
          //   controller: emailController,
          //   decoration: const InputDecoration(hintText: "Enter password"),
          // ),
          const CustomSpacer(),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.lightBlue),
              onPressed: () {},
              child: Text("Login")),
        ],
      ),
    ));
  }
}
