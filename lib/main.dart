import 'package:flutter/material.dart';
import 'package:recommendation/MainPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '점메추',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: LoadingPage(title: '로딩 페이지'),
    );
  }
}

class LoadingPage extends StatefulWidget {
  LoadingPage({super.key, required this.title});
  final String title;

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }
  
  _goMainPage(){
    Navigator.push(context, MaterialPageRoute(builder: (_) => MainPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // 플러터 기본 레이아웃 - 주석처리
            // const Text(
            //   'You have pushed the button this many times:',
            // ),
            // Text(
            //   '$_counter',
            //   style: Theme.of(context).textTheme.headlineMedium,
            // ),
          ],
        ),
      ),

      // 임시로, 메인페이지로 이동하는 버튼으로 바꾸었습니다.
      // 메인 페이지 구현이 되면 이 버튼을 없애고 자동으로 넘어가는 걸로 바꾸면 될 것 같습니다.
      floatingActionButton: FloatingActionButton(
        onPressed: _goMainPage,
        tooltip: 'main 페이지로',
        child: const Icon(Icons.arrow_forward_sharp),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
