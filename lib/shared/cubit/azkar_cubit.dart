import 'package:adhan_app/shared/cubit/azkar_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AzkarCubit extends Cubit<AzkarState>{
  AzkarCubit():super(AzkarInitialState());

  static AzkarCubit get(context) => BlocProvider.of(context);
  
}