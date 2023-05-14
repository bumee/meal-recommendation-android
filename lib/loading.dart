import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:recommendation/MainPage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

// 각도
import 'dart:math' as math;


class LoadingPage extends StatefulWidget {
  LoadingPage({super.key, required this.title});
  final String title;

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  _goMainPage(){
    Navigator.push(context, MaterialPageRoute(builder: (_) => MainPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(), // title: Text(widget.title),
      body: Stack(
        children: [
          // 점메추
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("점메추", style: TextStyle(fontFamily: "TitleBold", fontSize: 150.sp)),
                Text("점심 메뉴 추천좀", style: TextStyle(fontFamily: "TitleBold", fontSize: 55.sp)),
              ],
            ),
          ),


          // 양 옆
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // 맨 왼쪽
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FoodSVGPic(picName: "food1.svg",
                    size: 'm', degree: 40,),
                  FoodSVGPic(picName: "food2.svg",
                    size: 's', degree: -20,),
                  FoodSVGPic(picName: "food3.svg",
                    size: 'm', degree: 30,),
                  FoodSVGPic(picName: "food4.svg",
                    degree: 15,),
                  FoodSVGPic(picName: "food5.svg"),
                  FoodSVGPic(picName: "food1.svg",
                    size: 'm', degree: 40,),
                  FoodSVGPic(picName: "food2.svg",
                    size: 's', degree: -20,),
                  FoodSVGPic(picName: "food3.svg",
                    size: 's', degree: 30,),
                  FoodSVGPic(picName: "food4.svg",
                    degree: 15,),
                  FoodSVGPic(picName: "food5.svg", size: 'm',),
                  FoodSVGPic(picName: "food3.svg",
                    size: 'm', degree: 30,),
                ],
              ),

              // 오른쪽
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FoodSVGPic(picName: "food4.svg",
                    degree: 15,),
                  FoodSVGPic(picName: "food1.svg",
                    size: 'm', degree: 40,),
                  FoodSVGPic(picName: "food5.svg",
                    degree: 60,),
                  FoodSVGPic(picName: "food1.svg",
                    size: 'm', degree: 40,),
                  FoodSVGPic(picName: "food2.svg",
                    size: 's', degree: -20,),
                  FoodSVGPic(picName: "food3.svg",
                    size: 's', degree: 30,),
                  FoodSVGPic(picName: "food4.svg",
                    degree: 15,),
                  FoodSVGPic(picName: "food5.svg", size: 'm',),
                  FoodSVGPic(picName: "food3.svg",
                    size: 'm', degree: 30,),
                  FoodSVGPic(picName: "food2.svg",
                    size: 's', degree: -20,),
                  FoodSVGPic(picName: "food3.svg",
                    size: 'm', degree: 30,),

                ],
              ),
            ],
          ),

          // 상하
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FoodSVGPic(picName: "food5.svg", size: 'm',),
                  FoodSVGPic(picName: "food3.svg",
                    size: 'm', degree: 10,),
                  FoodSVGPic(picName: "food2.svg",
                    size: 'm', degree: -20,),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FoodSVGPic(picName: "food1.svg",
                    size: 'm', degree: 30,),
                  FoodSVGPic(picName: "food2.svg",
                    size: 'm', degree: -20,),
                  FoodSVGPic(picName: "food5.svg",
                    size: 'm', degree: 30,),
                ],
              ),
            ],
          )
        ],
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

class FoodSVGPic extends StatelessWidget {
  const FoodSVGPic({
    Key? key,
    required this.picName,
    // s, m, l
    this.size  : 'm',
    // 각도
    this.degree : 0,
  }) : super(key: key);

  final String location = "assets/images/foods/";
  final String picName;
  final String size;
  final int degree;

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.blue,
      width: size=='m' ? 200.sp : 150.sp,
      height: size=='m' ? 200.sp : 150.sp,
      child: Transform.rotate(
          child: SvgPicture.asset(location+picName, fit: BoxFit.fill),
          angle: degree * math.pi / 180,
      ),
    );
  }
}


