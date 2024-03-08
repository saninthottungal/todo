import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/Models/TaskProvider.dart';
import 'package:todo/Screens/ScreenHome/ScreenHome.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => TaskProvider())],
      child: MaterialApp(
        theme: ThemeData(
          //colorScheme:
          //  ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 175, 126, 235)),
          appBarTheme: const AppBarTheme(
              //rgba(175,126,235,255)
              color: Color.fromARGB(255, 255, 100, 137)),
          useMaterial3: true,
          textTheme: const TextTheme(
              titleLarge: TextStyle(
            fontFamily: "Angeline",
            color: Colors.white70,
          )),
        ),
        home: ScreenHome(),
      ),
    );
  }
}
