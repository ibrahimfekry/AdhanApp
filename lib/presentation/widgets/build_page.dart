import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildPage({
  required Color color,
  required String urlImage,
  required String title,
  required String subtitle,
})=>Container(
  color: color,
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(
        urlImage,
        width: double.infinity,
        height: 370.h,
        fit: BoxFit.fill,
      ),
      const SizedBox(height: 30,),
      Text(title,style: TextStyle(
        color:Colors.teal,
        fontSize: 22.sp,
        fontWeight: FontWeight.bold,
      ),),
       SizedBox(height: 15.h,),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Text(
          textDirection: TextDirection.rtl,
          subtitle,
          style: TextStyle(color: Colors.black,fontSize: 17.sp,fontWeight: FontWeight.w700),
        ),
      ),
    ],
  ),
);
