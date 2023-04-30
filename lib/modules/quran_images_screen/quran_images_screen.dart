import 'package:adhan_app/cache_helper.dart';
import 'package:adhan_app/shared/constants/colors.dart';
import 'package:adhan_app/shared/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

class QuranImages extends StatefulWidget {
  static String id = 'QuranImages';
   QuranImages({Key? key}) : super(key: key);

  @override
  State<QuranImages> createState() => _QuranImagesState();
}

class _QuranImagesState extends State<QuranImages> {
  int index= 1;

  @override
  void initState() {
    getDataFromShared();
    super.initState();
  }
  late int pageIndex;
  getDataFromShared(){
    pageIndex = CacheHelper.getData(key: Constants.sharedIndex.toString()) ?? 1 ;
  }

  @override
  Widget build(BuildContext context) {
    getDataFromShared();
        if(pageIndex != 0){
          return Scaffold(
            appBar: AppBar(
              backgroundColor: HexColor('C0E2CA'),
              elevation: 0,
              systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarIconBrightness: Brightness.dark,
                  statusBarColor: Colors.transparent
              ),
            ),
            backgroundColor: greenColor,
            body: PageView.builder(
              controller: PageController(
                initialPage: pageIndex,
              ),
              onPageChanged: (value){
                setState(() {
                  index = value;
                  CacheHelper.savaData(key: Constants.sharedIndex.toString(), value: index);
                });
              },
              itemBuilder: (context, index) => Image(
                  fit: BoxFit.fill,
                  image: NetworkImage('https://ayah.nawafdev.com/api/quran/images/$pageIndex')),
              itemCount: 604,
            ),
          );
        }
        else{
          return Scaffold(
            appBar: AppBar(
              backgroundColor: HexColor('C0E2CA'),
              elevation: 0,
              systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarIconBrightness: Brightness.dark,
                  statusBarColor: Colors.transparent
              ),
            ),
            backgroundColor: greenColor,
            body: PageView.builder(
              controller: PageController(
                initialPage: pageIndex,
              ),
              onPageChanged: (value){
                setState(() {
                  index = value;
                  CacheHelper.savaData(key: Constants.sharedIndex.toString(), value: index);
                });
              },
              itemBuilder: (context, index) => const Image(
                  fit: BoxFit.fill,
                  image: NetworkImage('https://ayah.nawafdev.com/api/quran/images/${1}')),
              itemCount: 604,
            ),
          );
        }

  }
}
