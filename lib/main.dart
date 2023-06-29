import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int cnt = 0;

  void onClicked() {
    cnt += 1;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Click Count',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Text(
                '$cnt',
                style: const TextStyle(
                  fontSize: 30,
                ),
              ),
              IconButton(
                iconSize: 40,
                onPressed: onClicked,
                icon: Icon(
                  Icons.add_box_rounded,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
