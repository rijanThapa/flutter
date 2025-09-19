import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/countPage.dart';
import 'package:flutter_application_1/pages/fake_data_page.dart';
import 'package:flutter_application_1/pages/fontPage.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/provider/counter_provider.dart';
import 'package:flutter_application_1/provider/fake_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => CounterProvider()), ChangeNotifierProvider(create: (_) => FakeProvider())],
      child: MaterialApp(debugShowCheckedModeBanner: false, home: FakeDataPage()),
    );
  }
}
