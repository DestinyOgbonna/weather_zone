import 'package:weather_zone/constants/exports.dart';
import 'package:weather_zone/screens/forecast_bottomsheet_screen/forcast_bottom_sheetviewmodel.dart';

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
