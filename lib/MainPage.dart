import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// 룰렛
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:recommendation/appSetting/appColor.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override

  StreamController<int> controller = StreamController<int>();

  final MenuNameController = TextEditingController();
  final MemoController = TextEditingController();

  String? _chosenValue = "한식";

  @override
  void dispose() {
    controller.close();
    super.dispose();
  }

  Widget build(BuildContext context) {

    var items = <String>[
      '버거킹',
      '덮덮밥',
      '이삭토스트',
      '마라샹궈',
      '엽떡',
      '키햐아'
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        // 하임 : 뒤로가기 흰색 버튼이 숨겨져 있는데 나중에 빼면 왼쪽정렬로 돌아옵니다.
        title: Row(
          children: [
            Icon(Icons.restaurant, color: Colors.black, size: 70.sp,),
            RichText(
                text: TextSpan(
                    style: TextStyle(color: Colors.black), //default
                    children: [
                      TextSpan(text: '  오늘의', style: TextStyle(fontFamily: "TitleBold", fontSize: 50.sp)),
                      TextSpan(text: ' 점메추', style: TextStyle(fontFamily: "TitleBold", fontSize: 70.sp)),
                    ])
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 룰렛 - 하임
            Container(
              height: 1400.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [


              Stack(
                alignment: Alignment.center,
                children: [
                  // 바깥 큰 원
                  CircleAvatar(
                    radius: 440.sp,
                    backgroundColor: AppColor.main2,
                  ),
                  

                  Container(
                    //color: Colors.grey[100],
                    height: 800.sp, width: 800.sp,
                    child: FortuneWheel(
                    // 적용 안되는 것 같음
                    //alignment: Alignment.centerRight,
                    selected: controller.stream,
                    indicators: <FortuneIndicator>[
                      // 추천받은 음식을 가리키는 화살표
                    ],
                    styleStrategy:
                    UniformStyleStrategy(
                      // 하임 : 이 TextAlign가 적용됐는지 모르겠음
                      //textAlign: TextAlign.center,
                      color: Colors.white,
                      borderColor: AppColor.main2,
                      borderWidth: 20.sp,
                      textStyle: TextStyle(fontFamily: "TitleBold", color: Colors.black, fontSize: 45.sp, ),
                    ),
                    items: [
                      // 룰렛 내에 들어갈 아이템들
                      for (var it in items) FortuneItem(child: Text(it)),
                    ],
                    ),
                  ),

                  // start button
                  TextButton(
                    onPressed: (){
                      print(' - - 룰렛 시작 !!');

                      setState(() {
                        controller.add(
                          Fortune.randomInt(0, items.length),
                        );
                      });
                    },
                    child: CircleAvatar(
                      radius: 85.sp,
                      backgroundColor: AppColor.main1,
                      child: Text("START", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                    ),
                  ),

                  // 화살표
                  Padding(
                    padding: EdgeInsets.only(bottom: 800.sp),
                    child:
                    Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          CircleAvatar(
                            radius: 50.sp,
                            backgroundColor: AppColor.main1,
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 65.sp),
                            height: 130.sp, width: 90.sp,
                            child: TriangleIndicator(
                              color: AppColor.main1,
                            ),
                          ),

                          Container(
                            padding: EdgeInsets.only(top: 13.sp),
                            child: CircleAvatar(
                              radius: 35.sp,
                              backgroundColor: Colors.white,
                            ),
                          ),

                        ],
                        ),
                  )

                ],
              )
                ],
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black
                )
              ),
              margin: EdgeInsets.only(left:45.sp, right: 45.sp),
            ),



            // 리스트 - 기범
            Container(
              height: 1400.h,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.black
                  ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: 20,),
                      Container(
                        padding: EdgeInsets.zero,
                        child: DropdownButton<String>(
                          value: _chosenValue,
                          style: TextStyle(color: Colors.black),

                          items: <String>[
                            '한식',
                            '일식',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          hint: Text(
                            "메뉴 선택",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600),
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              _chosenValue = value;
                            });
                          },
                        ),
                      ),
                      SizedBox(width: 240,),
                      IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              barrierDismissible: true, // 바깥 영역 터치시 닫을지 여부
                              builder: (BuildContext context) {
                                return SingleChildScrollView(
                                  child: AlertDialog(
                                    content: Container(
                                      child: Column(
                                        children: [
                                          Icon(Icons.restaurant, color: Colors.black, size: 70.sp,),
                                          RichText(
                                              text: TextSpan(
                                                  style: TextStyle(color: Colors.black), //default
                                                  children: [
                                                    TextSpan(text: '  먹거리', style: TextStyle(fontFamily: "TitleBold", fontSize: 50.sp)),
                                                    TextSpan(text: ' 추가', style: TextStyle(fontFamily: "TitleBold", fontSize: 70.sp)),
                                                  ])
                                          ),
                                          Container(width: 300,
                                              child: Divider(color: Colors.black, thickness: 2.0)
                                          ),
                                          TextFormField(
                                            controller: MenuNameController,
                                            decoration: const InputDecoration(
                                              hintText: "음식 이름",
                                                border: OutlineInputBorder(),

                                                // enabledBorder 가 들어간다면 border 는 무시됩니다.
                                                enabledBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Colors.green,
                                                    ))
                                            ),
                                          ),
                                          SizedBox(height: 10,),
                                          TextFormField(
                                            controller: MemoController,
                                            decoration: const InputDecoration(
                                              hintText: "메모",
                                                border: OutlineInputBorder(),

                                                // enabledBorder 가 들어간다면 border 는 무시됩니다.
                                                enabledBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Colors.green,
                                                    ))
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    insetPadding: const  EdgeInsets.fromLTRB(0,80,0, 80),
                                    actions: [
                                      TextButton(
                                        child: const Text('취소'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      TextButton(
                                        child: const Text('저장'),
                                        onPressed: () {
                                          items.add(MenuNameController.text.trim());
                                          Navigator.of(context).pop();
                                          setState(() {

                                          });
                                          MenuNameController.clear();
                                          print(items);
                                          print(items.length);
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              }
                          );
                        },
                        icon: Icon(Icons.add),
                      )
                    ],
                  ),

                ],
              ),

              margin: EdgeInsets.only(left: 45.sp, right: 45.sp),
            ),
          ],
        ),
      ),
    );
  }
}
