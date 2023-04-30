import 'package:adhan_app/shared/constants/colors.dart';
import 'package:adhan_app/shared/cubit/adhan_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../shared/components/component.dart';
import '../../shared/cubit/adhan_state.dart';


class PrayingTimesPage extends StatelessWidget {
  const PrayingTimesPage({super.key});
  static String id = 'Praying Times Page';
  @override
  Widget build(BuildContext context) {
    AdhanCubit cubit = AdhanCubit.get(context);
    return BlocBuilder<AdhanCubit, AdhanState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (cubit.prayerTimes != null)
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        children: [
                          const Image(
                              image: AssetImage('assets/images/mosque.png')),
                          SizedBox(
                            height: 20.h,
                          ),
                          Padding(
                            padding:EdgeInsetsDirectional.only(
                                start: 20.w, end: 20.w),
                            child: Container(
                              height: 150.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.r),
                                  color: containerColor,
                                  image: const DecorationImage(
                                      image: AssetImage(
                                          'assets/images/praying_times.jpg'),
                                      fit: BoxFit.fill)),
                              // padding: EdgeInsets.all(35),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 30.w,
                                  ),
                                  Text(
                                    'Prayer Times for Today',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 20.sp, color: whiteColor),
                                  ),
                                  Image(
                                      image: const AssetImage(
                                          'assets/images/lantern.png'),
                                      height: 110.h),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.h,horizontal: 8.w),
                              child: GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          childAspectRatio: 1.5,
                                          crossAxisSpacing: 10,
                                          mainAxisSpacing: 10),
                                  itemCount: 6,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) => DefaultItem(
                                        dataFormat: cubit.prayingTimes[index],
                                        image: AssetImage(
                                            cubit.imagePaths[index]),
                                      ))),
                        ],
                      ),
                    ),
                  if (cubit.prayerTimes == null)
                    const Center(child: CircularProgressIndicator()),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
