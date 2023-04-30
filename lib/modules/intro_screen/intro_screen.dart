import 'package:adhan_app/modules/hadith_screen/hadith_screen.dart';
import 'package:adhan_app/modules/praying-times_screen/praying-times_screen.dart';
import 'package:adhan_app/modules/quran_images_screen/quran_images_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../presentation/widgets/tab_widget.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);
  static String id = 'First Page';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background_image.jpg'),
          fit: BoxFit.fill,
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: const Text('Muslim '),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.dark,
              statusBarColor: Colors.transparent,
            ),
          ),
          body: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                TabWidget(
                  image: 'assets/images/quran.jpg',
                  tabText: 'The Quran',
                  tabPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => QuranImages()));
                  },
                ),
                Column(
                  children: [
                    TabWidget(
                      image: 'assets/images/prayer_time.png',
                      tabText:'Prayer Time',
                      tabPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PrayingTimesPage()));
                      },
                    ),
                  ],
                ),
                Column(
                  children: [
                    TabWidget(
                      image: 'assets/images/hadith.png',
                      tabText: 'The Hadith ',
                      tabPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HadithScreen()));
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
