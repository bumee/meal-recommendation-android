import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Page"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 룰렛 - 하임
            Container(
              height: 1400.h,
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
              child: Row(
                children: [
                  Text("기범님 파트"),
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
