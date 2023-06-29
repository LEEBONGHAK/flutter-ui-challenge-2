import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

// 앱의 데이터를 가지고 있는 부분
class _AppState extends State<App> {
  int cnt = 0;

  // onclicked 메서드 선언 및 데이터 입력
  void onClicked() {
    /**
     * setState는 State 클래스에게 데이터가 변경되었다고 알리는 함수
     * setState는 기본적으로 build method를 한번 더 호출하는 것
     * setState를 호출 하지 않는다면 build method는 실행되지 않음
     * setState 밖에 로직을 넣어도 괜찮으나, 명확성을 위해 setState 내부에 기입하는 것이 좋음
     *  */
    setState(() {
      cnt += 1;
    });
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
                icon: const Icon(
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
