part of 'hadith_cubit.dart';

@immutable
abstract class HadithState {}

class HadithInitialState extends HadithState {}

class HadithLoadingState extends HadithState {}

class HadithSuccessState extends HadithState {}

class HadithErrorState extends HadithState {}

class AzkarLoadingState extends HadithState {}

class AzkarSuccessState extends HadithState {}

class AzkarErrorState extends HadithState {}
