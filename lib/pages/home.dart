import 'package:app/controllers/auth_controller.dart';
import 'package:app/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final auth = Get.find<AuthC>();
  final login = Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HOME PAGE"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => auth.logout(login.rememberme.value),
        child: Icon(Icons.logout),
      ),
    );
  }
}
