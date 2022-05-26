import 'package:weather_zone/constants/exports.dart';

class NotificationModal extends ConsumerWidget {
  const NotificationModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: const BoxDecoration(
          color: appWhiteColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(45), topRight: Radius.circular(45))),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 19),
        child: ListView(
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
              padding: const EdgeInsets.only(left: 88.0, right: 88.0, top: 30),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const CustomButton(
                  buttonText: 'Your Notifications',
                  isDialogButton: true,
                ),
              ),
            ),
            const Text('Now'),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ListTile(
                leading: Image.asset('image/sun.png'),
                title: const Text('10 Mins Ago'),
                subtitle: const Text('Its a Sunny Day in YOur Locations'),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 38.0, bottom: 10.0),
              child: Text("Earlier"),
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ListTile(
                leading: Image.asset('image/sun.png'),
                title: const Text('10 Mins Ago'),
                subtitle: const Text('Its a Sunny Day in YOur Locations'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ListTile(
                leading: Image.asset('image/sun.png'),
                title: const Text('10 Mins Ago'),
                subtitle: const Text('Its a Sunny Day in YOur Locations'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
