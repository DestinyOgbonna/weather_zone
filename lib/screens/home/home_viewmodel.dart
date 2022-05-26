import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import 'package:weather_zone/models/weather.dart';
import 'package:weather_zone/services/api_network.dart';
import 'package:weather_zone/services/geo_locator.dart';

NetworkCalls networkCalls = NetworkCalls();

class HomeViewModel extends StateNotifier<HomeViewState> {
  HomeViewModel() : super(HomeViewState(weather: Weather()));
  String apiKey = '7382a0e93a740c47813c0a324d3800d1';

  //instantiating the userlocation class
  final userlocation = UserLocation();

  getUserCurrentTime() {
    DateTime now = DateTime.now();
    state = state.copyWith(
      currentTime: DateFormat.Hms().format(now),
      getDate: DateFormat("dd-MM-yyyy").format(
        DateTime.now(),
      ),
    );
  }

  Future<void> getCurrentWeatherDetailsOfUser() async {
    await userlocation.getUserCurrentLocation();
    try {
      var gettingCurrentUserWeather = await networkCalls.getData(
          'https://api.openweathermap.org/data/2.5/weather?lat=${userlocation.lat}&lon=${userlocation.long}&appid=$apiKey&units=metric');
      if (gettingCurrentUserWeather.statusCode == 200) {
        state = state.copyWith(loader: Loader.loading);
        final response = Weather.fromJson(gettingCurrentUserWeather.data);
        state = state.copyWith(weather: response, loader: Loader.success);
      } else {
        state = state.copyWith(loader: Loader.error);
      }
    } catch (e) {
      state = state.copyWith(loader: Loader.error);
      rethrow;
    }
  }
}

// Creating the HomeState class
class HomeViewState {
  Loader loader;
  Weather weather;
  final String currentTime;
  final String getDate;
  HomeViewState(
      {this.currentTime = '',
      this.getDate = '',
      this.loader = Loader.loading,
      required this.weather});

  HomeViewState copyWith(
      {Loader? loader,
      Weather? weather,
      String? currentTime,
      String? getDate}) {
    return HomeViewState(
        loader: loader ?? this.loader,
        weather: weather ?? this.weather,
        currentTime: currentTime ?? this.currentTime,
        getDate: getDate ?? this.getDate);
  }
}

// Created enums for loading states
enum Loader { loading, error, success }
