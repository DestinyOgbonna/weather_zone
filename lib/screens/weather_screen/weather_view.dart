import 'package:intl/intl.dart';
import 'package:weather_zone/constants/exports.dart';

class WeatherView extends ConsumerWidget {
  const WeatherView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    DateTime now = DateTime.now();
    String getCurrentTime = DateFormat.Hms().format(now);
    return Scaffold(
        backgroundColor: appPrimaryColor,
        body: SafeArea(
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 30.h, vertical: 55.h),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 10.0.h, right: 10.h),
                          child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(Icons.navigate_before,
                                  color: appWhiteColor)),
                        ),
                        Container(
                          height: 44.h,
                          width: 160.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40.r),
                            gradient: const LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  appWhiteColor,
                                  appPrimaryColor,
                                ]),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0.h),
                                child: const Icon(
                                  Icons.location_on,
                                  color: appWhiteColor,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0.h),
                                child: const Text(
                                  'Lagos,',
                                  style: TextStyle(color: appWhiteColor),
                                ),
                              ),
                              const Text('Nigeria',
                                  style: TextStyle(color: appWhiteColor)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Align(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 80.h),
                        height: MediaQuery.of(context).size.height * 0.30.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: appOutlineColor),
                          borderRadius: BorderRadius.circular(17.r),
                          color: appLightBlueColor,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(top: 18.0.h),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('image/Vector.png'),
                                  Padding(
                                    padding: EdgeInsets.all(8.0.h),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('USA',
                                            style: TextStyle(
                                                color: appWhiteColor,
                                                fontSize: 19.sp)),
                                        const Text('Mon 13 Apr',
                                            style:
                                                TextStyle(color: appWhiteColor))
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('34',
                                      style: TextStyle(
                                          color: appWhiteColor,
                                          fontSize: 90.sp)),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 98.0.h),
                                    child: Text('\u2103',
                                        style: TextStyle(
                                            color: appWhiteColor,
                                            fontSize: 19.sp)),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text('Lagos,',
                                        style: TextStyle(color: appWhiteColor)),
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(left: 3.0, right: 5.0),
                                    child: Text('Nigeria \u2022',
                                        style: TextStyle(color: appWhiteColor)),
                                  ),
                                  Text(getCurrentTime.toString(),
                                      style: const TextStyle(
                                          color: appWhiteColor)),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ))));
  }
}
