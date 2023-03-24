import 'package:flutter/material.dart';
import 'package:recommendation/MainPage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recommendation/loading.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // 하임 : 사이즈에 대하여는 논의 필요
      designSize: Size(1080, 2340),
      builder: (context, child){
        return MaterialApp(
          title: '점메추',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            // 글꼴 전체 변경
            fontFamily: "ContentRegular",
          ),
          debugShowCheckedModeBanner: false,
          home: LoadingPage(title: '로딩 페이지'),
        );
      },

    );

  }
}


