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
  bool showTitle = true;

  void toggleTitle() {
    setState(() {
      showTitle = !showTitle;
    });
  }

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
              showTitle ? MyLargeTitle() : const Text('nothing'),
              for (var n in nums) Text('$n'),
              IconButton(
                iconSize: 40,
                onPressed: onClicked,
                icon: const Icon(
                  Icons.add_box_rounded,
                ),
              ),
              IconButton(
                iconSize: 50,
                onPressed: toggleTitle,
                icon: const Icon(
                  Icons.remove_red_eye,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({
    super.key,
  });

  @override
  State<MyLargeTitle> createState() => _MyLargeTitleState();
}

class _MyLargeTitleState extends State<MyLargeTitle> {
  /// State를 초기화 하기 위한 메서드
  /// 대부분의 상황에서는 필요 없지만, 부모 요소에 의존하는 데이터를 초기화해야하는 경우 사용됨
  /// initState의 경우 항상 build 메서드보다 먼저 호출되어야 하며, 오직 단 한 번만 호출됨
  @override
  void initState() {
    super.initState();
  }

  /// widget이 스크린에서 제거될 때 호출되는 메서드
  /// widget이 widget tree에서 제거되기 전에 무엇인가를 취소할 때 사용됨
  @override
  void dispose() {
    super.dispose();
  }

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
