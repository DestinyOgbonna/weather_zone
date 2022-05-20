import 'package:flutter/material.dart';

class NextForeCast extends StatelessWidget {
  const NextForeCast({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text('April 5'),
          Image.asset('image/sun.png'),
          const Text('29 \u2103'),
        ],
      ),
    );
  }
}
