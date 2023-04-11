import 'package:adhan/adhan.dart';
import 'package:adhan_app/cubit/adhan_cubit.dart';
import 'package:adhan_app/cubit/adhan_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AdhanCubit()..getData()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme : ThemeData(
          scaffoldBackgroundColor: HexColor('DCDEDF'),
          appBarTheme: AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: HexColor('FEFEFE'),
              statusBarIconBrightness: Brightness.dark,
            )
          )
        ),
        home: MyHomePage(),
      ),
    );
  }
}

