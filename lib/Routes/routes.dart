import 'package:flutter_app_with_notification/bindings/my_home_bidnings.dart';
import 'package:flutter_app_with_notification/view/myhomepage.dart';
import 'package:get/get.dart';

class Routes {
  static const String myHomePage = '/myHomePage';
  static var list = [
    GetPage(
      name: myHomePage,
      page: () => MyHomePage(),
      binding: MyHomeControllerBinding(),
    ),
  ];
}
