import 'package:app/controllers/auth_controller.dart';
import 'package:app/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final login_C = Get.find<LoginController>();
    final auth_c = Get.find<AuthC>();
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Login",
              style: GoogleFonts.notoSansMandaic(
                  fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextField(
              controller: login_C.emailC,
              autocorrect: false,
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Obx(
              () => TextField(
                controller: login_C.passC,
                autocorrect: false,
                obscureText: login_C.hidden.value,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () => login_C.hidden.toggle(),
                      icon: login_C.hidden.value
                          ? Icon(Icons.remove_red_eye)
                          : Icon(Icons.remove_red_eye_outlined)),
                  labelText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Obx(
              () => CheckboxListTile(
                value: login_C.rememberme.value,
                onChanged: (value) => login_C.rememberme.toggle(),
                title: Text("Remember me"),
                controlAffinity: ListTileControlAffinity.leading,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                auth_c.login(login_C.emailC.text, login_C.passC.text,
                    login_C.rememberme.value);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                  elevation: 20),
              child: Text(
                "Login",
                style: GoogleFonts.notoSansGujarati(
                    fontSize: 15, fontWeight: FontWeight.w800),
              ),
            )
          ],
        ),
      ),
    );
  }
}
