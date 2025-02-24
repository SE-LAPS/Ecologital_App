import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/menu_screen.dart';
import 'providers/menu_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MenuProvider()),
      ],
      child: MaterialApp(
        title: 'Food Ordering App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const MenuScreen(),
      ),
    );
  }
}