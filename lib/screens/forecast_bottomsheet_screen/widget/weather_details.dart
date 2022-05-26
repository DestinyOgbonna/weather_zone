

import 'package:weather_zone/constants/exports.dart';

class WeatherDetails extends ConsumerWidget {
  const WeatherDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          const Text('29 \u2103',
              style: TextStyle(
                color: appBlackColor,
                fontSize: 15,
                fontWeight: FontWeight.w700,
              )),
          Image.asset('image/sun.png'),
          const Text('8 : 00 AM',
              style: TextStyle(
                color: appBlackColor,
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ))
        ],
      ),
    );
  }
}
