import 'package:flutter/material.dart';
import 'package:learning_provide/provider/users.dart';
import 'package:learning_provide/routes/app_routes.dart';
import 'package:learning_provide/views/user_form.dart';
import 'package:learning_provide/views/user_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MyHomePage(title: 'Flutter Demo Home Page'),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context)=> Users()),],
      child: MaterialApp(title: "List User App",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.teal[900],
            visualDensity: VisualDensity.adaptivePlatformDensity),
       // home: UserList(),
        routes: { AppRoutes.Home: (context)=> UserList(),
                  AppRoutes.USER_FORM:(context)=> UserForm()
        },

      ),
    );
  }
}
