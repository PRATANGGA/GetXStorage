import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  var rememberme = false.obs;
  var hidden = true.obs;
  late TextEditingController emailC;
  late TextEditingController passC;

  @override
  void onInit() {
    emailC = TextEditingController();
    passC = TextEditingController();
    final box = GetStorage();
    if (box.read("dataUser") != null) {
      final data = box.read("dataUser") as Map<String, dynamic>;
      emailC.text = data["email"];
      passC.text = data["password"];
      rememberme.value = data["rememberme"];
    }
    super.onInit();
  }

  @override
  void onClose() {
    emailC.dispose();
    passC.dispose();
    super.onClose();
  }
}
