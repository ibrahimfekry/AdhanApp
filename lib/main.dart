import 'package:adhan_app/cache_helper.dart';
import 'package:adhan_app/modules/hadith_screen/hadith_screen.dart';
import 'package:adhan_app/modules/praying-times_screen/praying-times_screen.dart';
import 'package:adhan_app/modules/intro_screen/intro_screen.dart';
import 'package:adhan_app/modules/onboarding_screen/onboarding_screen.dart';
import 'package:adhan_app/modules/quran_images_screen/quran_images_screen.dart';
import 'package:adhan_app/shared/constants/colors.dart';
import 'package:adhan_app/shared/cubit/adhan_cubit.dart';
import 'package:adhan_app/shared/cubit/hadith_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome') ?? false;
  runApp(MyApp(showHome: showHome));
}

class MyApp extends StatelessWidget {
  MyApp({
    super.key,
    required this.showHome,
  });
  final bool showHome;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360,690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
      return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AdhanCubit()..getData()),
          BlocProvider(
            create: (context) => HadithCubit()..getAllHadith(),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            QuranImages.id: (context) => QuranImages(),
            IntroPage.id: (context) => IntroPage(),
            PrayingTimesPage.id: (context) => PrayingTimesPage(),
            OnBoardingPage.id: (context) => OnBoardingPage(),
            HadithScreen.id: (context) => HadithScreen(),
          },
          theme: ThemeData(
              scaffoldBackgroundColor: silverColor,
              appBarTheme: AppBarTheme(
                  systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: whiteColor,
                statusBarIconBrightness: Brightness.dark,
              ))),
          initialRoute: showHome ? OnBoardingPage.id : IntroPage.id,
        ),
      );
    });
  }
}
