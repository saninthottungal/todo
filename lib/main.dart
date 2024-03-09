import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo/Database/DatabaseModel/TaskModel.dart';
import 'package:todo/Provider/TaskProvider.dart';
import 'package:todo/Screens/ScreenHome/ScreenHome.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(TaskModelAdapter().typeId)) {
    Hive.registerAdapter(TaskModelAdapter());
  }

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
        home: const ScreenHome(),
      ),
    );
  }
}
