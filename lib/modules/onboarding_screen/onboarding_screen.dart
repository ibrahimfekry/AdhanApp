import 'package:adhan_app/modules/intro_screen/intro_screen.dart';
import 'package:adhan_app/shared/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../quran_images_screen/quran_images_screen.dart';
import '../../presentation/widgets/build_page.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);
  static String id = 'OnBoardingPage';

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final controller = PageController();
  bool isLastPage = false;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding:  EdgeInsets.only(bottom: 80.h),
        child: PageView(
          controller: controller,
          onPageChanged: (index){
            setState(() {
              isLastPage = index == 2 ;
            });
          },
          children: [
            buildPage(
              color: blueColor,
              urlImage: 'assets/images/praying_man.png',
              title: 'مسلم',
              subtitle:'تطبيق مسلم عبارة عن تطبيق اسلامى يحتوى على مواقيت الصلاة الخاصة بموقعك الجغرافى ويحتوى ايضا على القران الكريم كاملا',
            ),
            buildPage(
                color: whiteColor,
                urlImage: 'assets/images/mosque_page_2.png',
                title:'مسلم',
                subtitle:'تطبيق مسلم يظهر لك مواقيت الصلاة'
            ),
            buildPage(
                color: whiteColor,
                urlImage: 'assets/images/hadith.jpg',
                title:'مسلم',
                subtitle:'تطبيق مسلم يحتوى على المصحف كاملا'
            ),

          ],
        ),
      ),
      bottomSheet: isLastPage
        ? TextButton(
        onPressed: ()async{
          final prefs = await SharedPreferences.getInstance();
          prefs.setBool('showHome', true  );
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const IntroPage()));
        },
        style: TextButton.styleFrom(shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
          foregroundColor:whiteColor,
          backgroundColor: tealColor,
          minimumSize: Size.fromHeight(80.h),
        ),
        child:  Text('Get Started',style: TextStyle(fontSize: 25.sp),),)
      :Container(
        padding:  EdgeInsets.symmetric(horizontal: 15.w),
        height: 80.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
                onPressed: () => controller.jumpToPage(2),
                child: const Text('Skip')),
            Center(
              child: SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: WormEffect(
                  spacing: 15,
                  dotColor: blackColor,
                  activeDotColor: tealColor,
                ),
                onDotClicked: (index) => controller.animateToPage(index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn),
              ),
            ),
            TextButton(
                onPressed: () {
                  controller.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut);
                },
                child: const Text('Next')),
          ],
        ),
      ),
    );
  }
}
