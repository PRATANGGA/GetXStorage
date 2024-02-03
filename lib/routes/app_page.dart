import 'package:app/pages/home.dart';
import 'package:app/pages/login.dart';
import 'package:app/routes/route_name.dart';
import 'package:get/get.dart';

class AppPage {
  static final pages = [
    GetPage(name: RouteName.home, page: () => HomePage()),
    GetPage(name: RouteName.login, page: () => LoginPage()),
  ];
}
