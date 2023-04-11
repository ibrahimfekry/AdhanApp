import 'package:flutter/material.dart';
class DefaultItem extends StatelessWidget {
   DefaultItem({Key? key,required this.dataFormat,required this.image}) : super(key: key);
  String? dataFormat;
  var image;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.fill,
            image:image,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      width: 150,
      height: 200,
      child: Column(
        mainAxisAlignment:
        MainAxisAlignment.center,
        children: [
          Text(
            "$dataFormat",
            // 'Fajr Time : \n${DateFormat.jm().format(cubit.prayerTimes!.fajr)}',
            style: const TextStyle(
                color: Colors.white,
                fontSize: 20),
          ),
        ],
      ),
    );
  }
}

