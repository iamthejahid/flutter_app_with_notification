import 'package:get/get.dart';

class MyHomeController extends GetxController {
  var counter = 0.obs;

  increment() {
    counter++;
  }

  decrement() {
    counter--;
  }
}
