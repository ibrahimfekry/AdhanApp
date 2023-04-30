import 'package:adhan_app/shared/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../data/model/hadith_model.dart';
import '../../shared/cubit/hadith_cubit.dart';

class HadithScreen extends StatelessWidget {
  HadithScreen({Key? key}) : super(key: key);
  static String id = 'Hadith Screen';

  late List<HadithModel> hadith;

  @override
  Widget build(BuildContext context) {
    HadithCubit cubit = HadithCubit.get(context);
    return Scaffold(
        backgroundColor: tealShadeColor,
        body: BlocBuilder<HadithCubit, HadithState>(
          builder: (context, state) {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: cubit.hadith.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.r),
                        color: whiteColor,
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
                      child: Text(
                        '${cubit.hadith[index]['arab']}',
                        style: TextStyle(fontSize: 20.sp, color: blackColor),
                      ),
                    ),
                  );
                });
          },
        ));
  }
}
