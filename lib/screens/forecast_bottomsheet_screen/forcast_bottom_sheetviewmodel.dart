import 'package:intl/intl.dart';
import 'package:weather_zone/constants/exports.dart';
import 'package:weather_zone/models/days_forecast.dart';
import 'package:weather_zone/services/api_network.dart';
import 'package:weather_zone/services/geo_locator.dart';

NetworkCalls networkCalls = NetworkCalls();

class ForecastViewModel extends StateNotifier<ForecastViewState> {
  ForecastViewModel() : super(ForecastViewState(daysForecast: DaysForecast()));
  final userlocation = UserLocation();
  String apiKey = '7382a0e93a740c47813c0a324d3800d1';

  getUserCurrentTime() {
    DateTime now = DateTime.now();
    state = state.copyWith(
      currentTime: DateFormat.Hms().format(now),
      getDate: DateFormat("dd-MM-yyyy").format(
        DateTime.now(),
      ),
    );
  }

  Future<void> getFiveDaysForecast() async {
    await userlocation.getUserCurrentLocation();
    try {
      var getFiveDaysForecast = await networkCalls.getData(
          'https://api.openweathermap.org/data/2.5/onecall?lat=${userlocation.lat}&lon=${userlocation.long}&exclude=hourly,minutely,current&appid=7382a0e93a740c47813c0a324d3800d1');
      if (getFiveDaysForecast.statusMessage == 'OK') {
        state = state.copyWith(loader: Loader.loading);
        final response = DaysForecast.fromJson(getFiveDaysForecast.data);
        state = state.copyWith(daysForecast: response, loader: Loader.success);
      } else {
        state = state.copyWith(loader: Loader.error);
      }
    } catch (e) {
      state = state.copyWith(loader: Loader.error);
      rethrow;
    }
  }
}

//creating enums for loading states

enum Loader {
  loading,
  error,
  success,
}

class ForecastViewState {
  DaysForecast daysForecast;
  Loader loader;
  final String currentTime;
  final String getDate;
//creating constructor
  ForecastViewState(
      {this.currentTime = '',
      this.getDate = '',
      required this.daysForecast,
      this.loader = Loader.loading});

  ForecastViewState copyWith({
    Loader? loader,
    String? getDate,
    String? currentTime,
    DaysForecast? daysForecast,
  }) {
    return ForecastViewState(
      loader: loader ?? this.loader,
      currentTime: currentTime ?? this.currentTime,
      getDate: getDate ?? this.getDate,
      daysForecast: daysForecast ?? this.daysForecast,
    );
  }
}
