import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthC extends GetxController {
  var isAuth = false.obs;
  final Map<String, String> _dataUser = {
    "email": "julangtp@gmail.com",
    "password": "julang",
  };

  void dialogError(String message) {
    Get.defaultDialog(title: "Terjadi Kesalahan", middleText: message);
  }

  Future<void> autoLogin() async {
    final box = GetStorage();
    if (box.read("dataUser") != null) {
      final data = box.read("dataUser") as Map<String, dynamic>;
      login(data["email"], data["password"], data["rememberme"]);
    }
  }

  void login(String email, String pass, bool rememberme) {
    if (email != '' && pass != '') {
      if (GetUtils.isEmail(email)) {
        if (email == _dataUser['email'] && pass == _dataUser['password']) {
          if (rememberme) {
            final box = GetStorage();
            box.write(
              'dataUser',
              {
                "email": email,
                "password": pass,
                "rememberme": rememberme,
              },
            );
          } else {
            final box = GetStorage();
            if (box.read('dataUser') != null) {
              box.erase();
            }
          }
          isAuth.value = true;
        } else {
          dialogError("Data user tidak ditemukan ");
        }
      } else {
        dialogError("Email tidak valid");
      }
    } else {
      dialogError("Email harus diisi");
    }
  }

  void logout(bool rememberme) {
    final box = GetStorage();
    if (box.read('dataUser') != null) {
      box.erase();
    }

    isAuth.value = false;
  }
}
