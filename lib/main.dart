import 'package:flutter/material.dart';
import 'package:login_example/providers/dropdown_provider.dart';
import 'package:login_example/providers/table_provider.dart';
import 'package:login_example/screens/components_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => TableProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => DropDownProvider(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ComponentsView(),
    );
  }
}
