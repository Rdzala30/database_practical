import 'package:flutter/material.dart';
import 'user_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/userList',
      routes: {
        '/userList': (context) => UserListPage(),
      },
    );
  }
}
