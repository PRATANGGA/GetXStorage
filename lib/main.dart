import 'package:app/controllers/auth_controller.dart';
import 'package:app/controllers/login_controller.dart';
import 'package:app/pages/home.dart';
import 'package:app/pages/login.dart';
import 'package:app/routes/app_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final loginC = Get.put(LoginController());
  final authC = Get.put(AuthC());
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: authC.autoLogin(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Obx(
            () => GetMaterialApp(
              debugShowCheckedModeBanner: false,
              home: authC.isAuth.isTrue ? HomePage() : LoginPage(),
              getPages: AppPage.pages,
            ),
          );
        }
        return MaterialApp(
          home: Scaffold(
              body: Center(
            child: CircularProgressIndicator(),
          )),
        );
      },
    );
  }
}
