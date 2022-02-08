import 'package:battery/widgets/battery.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Battery'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Battery(
              value: 100.0,
              size: 200.0,
            ),
            const SizedBox(height: 40.0),
            Battery(
              value: 70.0,
              size: 180.0,
            ),
            const SizedBox(height: 40.0),
            Battery(
              value: 60.0,
              size: 150.0,
            ),
            const SizedBox(height: 40.0),
            Battery(
              value: 30.0,
              size: 100.0,
            ),
            const SizedBox(height: 40.0),
            Battery(
              value: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}
