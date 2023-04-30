import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultItem extends StatelessWidget {
  DefaultItem({Key? key, required this.dataFormat, required this.image})
      : super(key: key);
  String? dataFormat;
  var image;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: image,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      width: 150,
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$dataFormat",
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        ],
      ),
    );
  }
}

class DefaultContainer extends StatelessWidget {
  DefaultContainer({this.azkarText,this.azkarRepeat,Key? key}) : super(key: key);
  String? azkarText;
  int? azkarRepeat;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.r),
              ),
              padding: EdgeInsets.all(20),
              child: Text(
                  '$azkarText'),
            ),
            Container(
              height: 60.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 50.w,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.share,
                          size: 28.r,
                          color: Colors.green,
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      GestureDetector(
                        onTap: (){
                          print('afsfd');
                        },
                          child: Text(
                        'مشاركة',
                        style: TextStyle(fontSize: 25.sp, color: Colors.white),
                      )),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Text(
                          '$azkarRepeat',
                          style: TextStyle(fontSize: 25.sp, color: Colors.green),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        'التكرار',
                        style: TextStyle(fontSize: 25.sp, color: Colors.white),
                      ),
                      SizedBox(
                        width: 50.w,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
