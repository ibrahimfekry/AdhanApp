import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
part 'hadith_state.dart';

class HadithCubit extends Cubit<HadithState> {
  HadithCubit() : super(HadithInitialState());
  static HadithCubit get(context) => BlocProvider.of(context);

  List hadith = [];
  Future <List<dynamic>>getAllHadith()async {
    emit(HadithLoadingState());
    http.Response? response;
    var url = 'https://hadis-api-id.vercel.app/hadith/abu-dawud?page=2&limit=300';
    response = await http.get(Uri.parse(url)).then((value){
      Map allHadith = jsonDecode(value.body);
      hadith = allHadith['items'];
      emit(HadithSuccessState());
    }).catchError((error){
      print(error);
      emit(HadithErrorState());
    });
    return hadith;
  }


}
