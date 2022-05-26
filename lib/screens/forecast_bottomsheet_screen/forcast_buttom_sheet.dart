import 'package:weather_zone/providers/my_providers.dart';
import '../../constants/exports.dart';

class ForcastModal extends ConsumerStatefulWidget {
  const ForcastModal({Key? key}) : super(key: key);

  @override
  ConsumerState<ForcastModal> createState() => _ForcastModalState();
}

class _ForcastModalState extends ConsumerState<ForcastModal> {
  @override
  void initState() {
    super.initState();
    ref.read(myForecastViewModel.notifier).getUserCurrentTime();
    ref.read(myForecastViewModel.notifier).getFiveDaysForecast();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final state = ref.watch(myForecastViewModel);
    return Container(
      decoration: const BoxDecoration(
        color: appWhiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(45),
          topRight: Radius.circular(45),
        ),
      ),
      child: state.loader == Loader.loading
          ? const Center(child: CircularProgressIndicator.adaptive())
          : state.loader == Loader.error
              ? const Center(child: Text('No data found'))
              : SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 19),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 18.0),
                          child: Divider(
                            height: 1,
                            color: Colors.grey,
                            thickness: 1,
                            indent: 150,
                            endIndent: 150,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 88.0, right: 88.0, top: 30),
                          child: InkWell(
                            onTap: () {
                              ref
                                  .watch(myForecastViewModel.notifier)
                                  .getFiveDaysForecast();
                              Navigator.pop(context);
                            },
                            child: const CustomButton(
                              buttonText: 'Forecast report',
                              isDialogButton: true,
                            ),
                          ),
                        ),
                        const Text('Today',
                            style: TextStyle(
                              color: appBlackColor,
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                            )),
                        const SizedBox(
                          height: 19,
                        ),
                        Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.1,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: appOutlineColor,
                              )),
                          child: Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Column(
                                  children: [
                                    const Text('34\u2103',
                                        style: TextStyle(
                                          color: appBlackColor,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                        )),
                                    Image.asset('image/sun.png'),
                                    Text(state.currentTime,
                                        style: const TextStyle(
                                          color: appBlackColor,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                        ))
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Column(
                                  children: [
                                    const Text('34 \u2103',
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
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Column(
                                  children: [
                                    const Text('34 \u2103',
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
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Column(
                                  children: [
                                    const Text('34 \u2103',
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
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Column(
                                  children: [
                                    const Text('34 \u2103',
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
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 19,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('Next forecast',
                                style: TextStyle(
                                  color: appBlackColor,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                )),
                            CustomButton(
                              isSmallButton: true,
                              buttonText: 'Five Days',
                              isDialogButton: false,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 19,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: appOutlineColor,
                              )),
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: state.daysForecast.daily!.length,
                            itemBuilder: (BuildContext ontext, index) {
                              return Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(state.getDate),
                                    Image.asset('image/sun.png'),
                                    Text(state.daysForecast.daily![0].temp!.max
                                        .toString()),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
    );
  }
}
