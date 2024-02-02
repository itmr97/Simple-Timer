import 'package:flutter/material.dart';
import 'package:timer/counter.dart';

// ignore: camel_case_types
class Set_time extends StatefulWidget {
  const Set_time({super.key});

  @override
  State<StatefulWidget> createState() {
    return _set_timestate();
  }
}

// ignore: camel_case_types
class _set_timestate extends State<Set_time> {
    int selectedNumber=0;
  void onButtonPressed(int number) {
    setState(() {
      selectedNumber = number;
    });
  }
 void showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
      duration:const Duration(seconds: 2), // Set the duration for how long the snackbar will be displayed
    );

    // Find the Scaffold in the widget tree and show the Snackbar
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
          body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
          const Text(
            'set time',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                onButtonPressed(1);
              },
              child:const  Text('1 min'),
            ),
            ElevatedButton(
              onPressed: () {
                onButtonPressed(5);
              },
              child: const Text('5 min'),
            ),
            ElevatedButton(
              onPressed: () {
                onButtonPressed(10);
                
              },
              child:const  Text('10 min'),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                if (selectedNumber != 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => counter(selectedNumber: selectedNumber),
                    ),
                  );
                } else {

                  showSnackBar(context, 'choose the time first ');
                  // Handle the case when no number is selected.

                }
              },
              child: const Text('Next'),
            ),

        ]),
      )),
    );
  }
}
