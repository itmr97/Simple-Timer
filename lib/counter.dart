import 'dart:async';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:timer/set_time_screen.dart';
import 'package:timer/start_screen.dart';

// ignore: camel_case_types
class counter extends StatefulWidget {
  const counter({super.key, required this.selectedNumber});

  final int selectedNumber;

  @override
  State<StatefulWidget> createState() {
    return _counterstate();
  }
}

// ignore: camel_case_types
class _counterstate extends State<counter> {
  int minutes = 0; // Change this to your desired number of minutes
  int seconds = 0;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    minutes = widget.selectedNumber;
    startTimer();
  }

  void startTimer() {
    const oneSecond = Duration(seconds: 1);
    timer = Timer.periodic(oneSecond, (Timer timer) {
      setState(() {
        if (minutes == 0 && seconds == 0) {
          timer.cancel(); // Timer is done, cancel it
          playNotificationSound();
        } else if (seconds == 0) {
          minutes -= 1;
          seconds = 59;
        } else {
          seconds -= 1;
        }
      });
    });
  }

  void swtichscreen() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Set_time()),
      );
    });
  }

  void playNotificationSound() {
    AssetsAudioPlayer.newPlayer().open(
      Audio("assets/audio/iphone_alarm.mp3"),
      autoStart: true,
      showNotification: true,
    );
  }

  @override
  void dispose() {
    timer.cancel(); // Cancel the timer to prevent memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String formattedTime =
        '$minutes:${seconds < 10 ? '0$seconds' : '$seconds'}';
    return MaterialApp(
      home: Scaffold(
          body: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text(
            'start counting down for ${widget.selectedNumber} min ',
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 100),
          Text(
            formattedTime,
            style: const TextStyle(fontSize: 50),
          ),
          const SizedBox(height: 100),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Start_Screen(swtichscreen)),
              );
            },
            child: const Text('ReStart'),
          )
        ]),
      )),
    );
  }
}
