import 'package:weather_zone/constants/exports.dart';
import 'package:weather_zone/ui/forecast_bottomsheet/forcast_bottom_sheetviewmodel.dart';
import 'package:weather_zone/ui/home/home_viewmodel.dart';
import 'package:weather_zone/ui/notification_modal/notification_modall_viewmodei.dart';
import 'package:weather_zone/ui/onboarding/onboarding_viewmodel.dart';
import 'package:weather_zone/ui/weather_view/weather_viewmodel.dart';

final myHomeViewModel = StateNotifierProvider<HomeViewModel, HomeViewState>(
    (ref) => HomeViewModel());
final myNotificationViewModel =
    ChangeNotifierProvider((ref) => NotificationViewModel());
final myOnboardingViewModel =
    ChangeNotifierProvider((ref) => OnboardingViewModel());
final myForecastViewModel =
    StateNotifierProvider.autoDispose<ForecastViewModel, ForecastViewState>(
        (ref) => ForecastViewModel());
final myWeatherViewModel = ChangeNotifierProvider((ref) => WeatherViewModel());
