import 'package:adhan_app/shared/components/component.dart';
import 'package:flutter/material.dart';

class AzkarSabah extends StatelessWidget {
  const AzkarSabah({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('أذكار الصباح',style: TextStyle(fontSize: 30),),
        backgroundColor: Colors.orangeAccent,
        centerTitle: true,
        elevation: 0,
        leading: Image(image: AssetImage('assets/images/azkar_sabah.png')),
      ),
      body: ListView(
        children: [
          Text('')
        ],
      ),
    );
  }
}
