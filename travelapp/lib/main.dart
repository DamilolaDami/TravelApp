import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:travelapp/homescreen.dart';
import 'package:travelapp/themeprovider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => ThemeNotifier(),
        child: Consumer<ThemeNotifier>(
            builder: (context, ThemeNotifier notifier, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: notifier.darkTheme ? light : dark,
            home: HomeScreen(),
          );
        }));
  }
}
