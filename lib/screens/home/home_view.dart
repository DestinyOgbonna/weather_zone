import 'package:weather_zone/constants/exports.dart';
import 'package:weather_zone/providers/my_providers.dart';

import 'home_viewmodel.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  //late Weather weather;
  @override
  void initState() {
    super.initState();
    ref.read(myHomeViewModel.notifier).getCurrentWeatherDetailsOfUser();
    ref.read(myHomeViewModel.notifier).getUserCurrentTime();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final state = ref.watch(myHomeViewModel);

    return Scaffold(
      backgroundColor: appWhiteColor,
      body: SafeArea(
        child:
         state.loader == Loader.loading
            ? const Center(child: CircularProgressIndicator())
            : state.loader == Loader.error
                ? const Center(child: Text('NO data'))
                : 
                SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 55),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const WeatherView()));
                                },
                                child: Container(
                                  height: 44,
                                  width: 180,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    color: appLightBlueColor,
                                  ),
                                  child: Row(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.location_on,
                                          color: appWhiteColor,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          ' ${state.weather.name}',
                                          style: const TextStyle(
                                              color: appWhiteColor),
                                        ),
                                      ),
                                      Text(' ${state.weather.sys!.country}',
                                          style: const TextStyle(
                                              color: appWhiteColor)),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (context) =>
                                          const NotificationModal());
                                },
                                child: Container(
                                    height: 44,
                                    width: 53,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(17),
                                      color: appLightBlueColor,
                                    ),
                                    child: const Icon(
                                      Icons.notifications,
                                      color: appWhiteColor,
                                      size: 30,
                                    )),
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 50),
                            height: MediaQuery.of(context).size.height * 0.35,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(width: 1, color: appOutlineColor),
                              borderRadius: BorderRadius.circular(17),
                              color: appLightBlueColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 18.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset('image/Vector.png'),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                ' ${state.weather.sys?.country}',
                                                style: const TextStyle(
                                                    color: appWhiteColor,
                                                    fontSize: 19)),
                                            Text(state.getDate,
                                                style: const TextStyle(
                                                    color: appWhiteColor))
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('${state.weather.main?.temp}',
                                          style: const TextStyle(
                                              color: appWhiteColor,
                                              fontSize: 110)),
                                      const Padding(
                                        padding: EdgeInsets.only(bottom: 98.0),
                                        child: Text('\u2103',
                                            style: TextStyle(
                                                color: appWhiteColor,
                                                fontSize: 19)),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('${state.weather.name}',
                                            style: const TextStyle(
                                                color: appWhiteColor)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 3.0, right: 5),
                                        child: Text(
                                            '${state.weather.sys?.country} \u2022',
                                            style: const TextStyle(
                                                color: appWhiteColor)),
                                      ),
                                      Text(state.currentTime,
                                          style: const TextStyle(
                                              color: appWhiteColor)),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 100.0),
                            child: InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                    enableDrag: true,
                                    context: context,
                                    builder: (context) => const ForcastModal());
                              },
                              child: const CustomButton(
                                buttonText: 'Forecast report',
                                isDialogButton: false,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
      ),
    );
  }
}
