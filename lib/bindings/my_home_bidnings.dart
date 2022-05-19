import 'package:flutter_app_with_notification/controller/my_home_controller.dart';
import 'package:get/get.dart';

class MyHomeControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(
      MyHomeController(),
      permanent: true,
      // Why this is permanent?
      // Cause we are about to use firebase notification listner in MyHomeConroller.
      // out objective is to listen if the app is mode.
      //
    );
  }
}
