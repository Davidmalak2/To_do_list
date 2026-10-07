import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todolist/data/models/user_model.dart';
import 'package:todolist/view/screens/add_task_screen.dart';
import 'package:todolist/view/screens/home_screen.dart';
import 'package:todolist/view/screens/profile_screen.dart';
import 'package:todolist/core/utils/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  await Hive.initFlutter();

  // Register Hive Adapter
  Hive.registerAdapter(UserModelAdapter());

  // Open User Box
  await Hive.openBox<UserModel>('User');

  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: AppRoutes.profile,

      routes: {
        AppRoutes.profile: (context) => const ProfileScreen(),
        AppRoutes.home: (context) => const HomeScreen(),
        AppRoutes.addTask: (context) => const AddTaskScreen(),
      },
    );
  }
}