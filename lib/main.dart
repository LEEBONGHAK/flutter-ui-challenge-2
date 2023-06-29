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
  List<int> nums = [];

  // onClicked 메서드 선언 및 데이터 입력
  void onClicked() {
    /// setState는 State 클래스에게 데이터가 변경되었다고 알리는 함수
    /// setState는 기본적으로 build method를 한번 더 호출하는 것
    /// setState를 호출 하지 않는다면 build method는 실행되지 않음
    /// setState 밖에 로직을 넣어도 괜찮으나, 명확성을 위해 setState 내부에 기입하는 것이 좋음
    setState(() {
      nums.add(nums.length);
    });
  }

  /// BuildContext: 모든 상위 요소들에 대한 정보
  /// 즉, widget tree 에 대한 정보를 가지고 있음
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const MyLargeTitle(),
              for (var n in nums) Text('$n'),
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

class MyLargeTitle extends StatelessWidget {
  const MyLargeTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'My Large Title',
      style: TextStyle(
        fontSize: 30,
        color: Theme.of(context).textTheme.titleLarge?.color,
      ),
    );
  }
}
