import 'package:flutter/material.dart';
import 'package:timer/start_screen.dart';
import 'package:timer/set_time_screen.dart';

// ignore: camel_case_types
class swtich extends StatefulWidget {
  const swtich({super.key});

  @override
  State<swtich> createState() {
    return _swtichstate();
  }
}

// ignore: camel_case_types
class _swtichstate extends State<swtich> {
  var activescreen = 'start-screen';

  void swtichscreen() {
    setState(() {
      activescreen = 'set_time_screen';
    });
  }
  
  @override
  Widget build(BuildContext context) {

    final Widget screenwight;
   switch (activescreen) {
    case 'set_time_screen':
      screenwight= const Set_time();
      break;
    default:
      screenwight=Start_Screen(swtichscreen);
   }
    return MaterialApp(
      home: Scaffold(
        body: screenwight
      ),
    );
  }
  
}
