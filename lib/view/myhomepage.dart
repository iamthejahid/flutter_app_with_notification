import 'package:flutter/material.dart';
import 'package:flutter_app_with_notification/controller/my_home_controller.dart';
import 'package:get/get.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final _controller = Get.put(MyHomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Obx(
              () => Text(
                '${_controller.counter.value}',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            Row(
              children: [
                const Expanded(child: SizedBox()),
                FloatingActionButton(
                  onPressed: () => _controller.increment(),
                  child: const Icon(Icons.add),
                ),
                FloatingActionButton(
                  onPressed: () => _controller.decrement(),
                  child: const Icon(Icons.remove),
                ),
                const Expanded(child: SizedBox()),
              ],
            )
          ],
        ),
      ),
    );
  }
}
