import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'component.dart';
import 'cubit/adhan_cubit.dart';
import 'cubit/adhan_state.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

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
                          const Image(image: AssetImage('assets/images/mosque.png')),
                          const SizedBox(height: 20,),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(
                                start: 20, end: 20),
                            child: Container(
                              height: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color:
                                      const Color.fromRGBO(85, 181, 161, 1),
                                  image: const DecorationImage(
                                      image: AssetImage(
                                          'assets/images/praying_times.jpg'),
                                      fit: BoxFit.fill)),
                              // padding: EdgeInsets.all(35),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Text(
                                    'Prayer Times for Today',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                  Image(
                                      image: AssetImage(
                                          'assets/images/lantern.png'),
                                      height: 110),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 20,),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
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
                                  itemBuilder: (context, index) =>
                                      DefaultItem(
                                          dataFormat: cubit.prayingTimes[index],
                                          image: AssetImage('${cubit.imagePaths[index]}'),
                                      )
                              )
                              // GridView(
                              //     gridDelegate:
                              //         const SliverGridDelegateWithFixedCrossAxisCount(
                              //             crossAxisCount: 2,
                              //             childAspectRatio: 1.5,
                              //             crossAxisSpacing: 10,
                              //             mainAxisSpacing: 10),
                              //     shrinkWrap: true,
                              //     scrollDirection: Axis.vertical,
                              //     physics: const NeverScrollableScrollPhysics(),
                              //     children: [
                              //       DefaultItem(image: AssetImage('assets/images/sunset.jpg'),
                              //           dataFormat: 'Fajr Time : \n${DateFormat.jm().format(cubit.prayerTimes!.fajr)}'
                              //       ),
                              //       DefaultItem(image: AssetImage('assets/images/sunrise.jpg'),
                              //           dataFormat: 'Sunrise Time: ${DateFormat.jm().format(cubit.prayerTimes!.sunrise)}'
                              //       ),
                              //       DefaultItem(image: AssetImage('assets/images/duhur.jpg'),
                              //           dataFormat: 'Dhuhr Time: ${DateFormat.jm().format(cubit.prayerTimes!.dhuhr)}'
                              //       ),
                              //       DefaultItem(image: AssetImage('assets/images/asr.jpg'),
                              //           dataFormat: 'Asr Time: ${DateFormat.jm().format(cubit.prayerTimes!.asr)}'
                              //       ),
                              //       DefaultItem(image: AssetImage('assets/images/maghrib.jpg'),
                              //           dataFormat: 'Maghrib Time: ${DateFormat.jm().format(cubit.prayerTimes!.maghrib)}'
                              //       ),
                              //       DefaultItem(image: AssetImage('assets/images/isha.jpg'),
                              //           dataFormat: 'Isha Time: ${DateFormat.jm().format(cubit.prayerTimes!.isha)}'
                              //       ),
                              //     ],
                              // ),
                              ),
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
