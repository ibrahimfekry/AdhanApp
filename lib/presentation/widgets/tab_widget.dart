import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabWidget extends StatelessWidget {
  TabWidget({Key? key,this.tabPressed,this.image,this.tabText}) : super(key: key);

  String? image;
  VoidCallback? tabPressed;
  String? tabText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h,horizontal:50.w),
      child: Container(
        height: 150.h,
        width: 350.w,
        padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
        margin: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: Colors.white,
        ),
        child: GestureDetector(
          onTap: tabPressed,
          child: Tab(
            icon: Image.asset(
              image!,
              height: 50.h,
            ),
            iconMargin: EdgeInsets.symmetric(vertical: 15.h),text:tabText,
          ),
        ),
      ),
    );
  }
}

