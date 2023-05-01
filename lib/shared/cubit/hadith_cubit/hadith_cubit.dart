import 'dart:convert';

import 'package:adhan_app/shared/cubit/hadith_cubit/hadith_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
class HadithCubit extends Cubit<HadithState> {
  HadithCubit() : super(HadithInitialState());

  static HadithCubit get(context) => BlocProvider.of(context);

  List hadith = [];

  Future <List<dynamic>> getAllHadith() async {
    emit(HadithLoadingState());
    var url = 'https://hadis-api-id.vercel.app/hadith/abu-dawud?page=2&limit=300';
    http.get(Uri.parse(url)).then((value) {
      Map allHadith = jsonDecode(value.body);
      hadith = allHadith['items'];
      emit(HadithSuccessState());
    }).catchError((error) {
      emit(HadithErrorState());
    });
    return hadith;
  }
}