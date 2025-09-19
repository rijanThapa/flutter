import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/counter_provider.dart';
import 'package:provider/provider.dart';

class CountPage extends StatelessWidget {
  const CountPage({super.key});

  @override
  Widget build(BuildContext context) {
 

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<CounterProvider>(
            builder: (context, value, child) => Text(value.count.toString()),
          ),
          Consumer<CounterProvider>(
            builder: (context, value, child) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(value.count.toString()),
                  ElevatedButton(
                    onPressed: () {
                      print("Increment button pressed");
                      value.increment();
                    },
                    child: Text("+"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      value.decrement();
                    },
                    child: Text("-"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
