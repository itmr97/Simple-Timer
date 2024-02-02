import 'package:flutter/material.dart';

// ignore: camel_case_types
class Start_Screen extends StatelessWidget
{
   const Start_Screen(this.swtichscreen,{super.key});

   final void Function() swtichscreen;

  @override
  Widget build(BuildContext context)
  {
    return   MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
               const Text('Timer App',style: TextStyle(
                fontSize: 40,
               ),),
              const  SizedBox(height: 30),
               Transform.scale(
                    scale: 0.5, // Set your desired scale factor
                    child: Image.asset('assets/images/stopwatch.png', ),),
               const  SizedBox(height: 20),
               OutlinedButton(onPressed: swtichscreen, child: const Text('Start'))
              
            ],

          ),
      ),
    )
    );

  }
}