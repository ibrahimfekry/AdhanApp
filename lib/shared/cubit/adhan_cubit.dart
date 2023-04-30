
import 'package:adhan/adhan.dart';
import 'package:adhan_app/shared/cubit/adhan_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';


class AdhanCubit extends Cubit<AdhanState> {
  AdhanCubit() : super(AdhanInitialState());
  static AdhanCubit get(context) => BlocProvider.of(context);

  Location location = Location();
  String? locationError;
  PrayerTimes? prayerTimes;
  Future<LocationData?> getLocationData() async {
    LocationData newLocation;
    var serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return null;
      }
    }
    var permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }
    newLocation = await location.getLocation();
    return newLocation;
  }

  getData() async {
    emit(CoordinateLoadingState());
    await getLocationData().then((locationData) {
      if (locationData != null) {
        prayerTimes = PrayerTimes(
            Coordinates(double.parse(locationData.latitude.toString()),
                double.parse(locationData.longitude.toString())),
            DateComponents.from(DateTime.now()),
            CalculationMethod.karachi.getParameters());
      }
      emit(CoordinateSuccessState());
    }).catchError((error) {
      locationError = "Couldn't Get Your Location!";
      emit(CoordinateErrorState());
    });
  }

  List<String> imagePaths = [
    'assets/images/sunset.jpg',
    'assets/images/sunrise.jpg',
    'assets/images/duhur.jpg',
    'assets/images/asr.jpg',
    'assets/images/maghrib.jpg',
    'assets/images/isha.jpg',
  ];

  late List<String> prayingTimes = [
    'Fajr Time : \n${DateFormat.jm().format(prayerTimes!.fajr)}',
    'Sunrise Time: ${DateFormat.jm().format(prayerTimes!.sunrise)}',
    'Dhuhr Time: ${DateFormat.jm().format(prayerTimes!.dhuhr)}',
    'Asr Time: ${DateFormat.jm().format(prayerTimes!.asr)}',
    'Maghrib Time: ${DateFormat.jm().format(prayerTimes!.maghrib)}',
    'Isha Time: ${DateFormat.jm().format(prayerTimes!.isha)}',
  ];

}
