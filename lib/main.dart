import 'package:flutter/material.dart';
import 'package:practical_one/presentation/widget/user_details.dart';
import 'package:practical_one/presentation/widget/user_list.dart';

import 'di/register_objects.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  void didChangeDependencies() async {
    await registerObjectsToDi();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      initialRoute: UsersPage.route,
      routes: {
        UsersPage.route: (context) => UsersPage(),
        UserDetailsPage.route: (context) => UserDetailsPage()
      },
    );
  }
}

