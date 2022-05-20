import 'package:flutter/material.dart';
import 'package:weather_zone/constants/colors.dart';


class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.buttonText,
      this.isDialogButton = false,
      this.isSmallButton = false})
      : super(key: key);

  final String buttonText;
  final bool isDialogButton;
  final bool isSmallButton;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: isSmallButton ? 35 : 55,
      width: isSmallButton ? 100 : double.infinity,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: appOutlineColor),
        borderRadius: isDialogButton
            ? BorderRadius.circular(30)
            : BorderRadius.circular(6),
        color: isDialogButton ? appWhiteBlueShade : appLightBlueColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: isSmallButton
                ? const EdgeInsets.only(right: 0)
                : const EdgeInsets.only(right: 18.0),
            child: isDialogButton
                ? Text(
                    buttonText,
                    style:
                        const TextStyle(color: appLightBlueColor, fontSize: 18),
                  )
                : Text(
                    buttonText,
                    style: const TextStyle(color: appWhiteColor, fontSize: 18),
                  ),
          ),
          isSmallButton
              ? const Text('')
              : isDialogButton
                  ? const Icon(
                      Icons.arrow_downward,
                      color: appLightBlueColor,
                      size: 15,
                    )
                  : const Icon(
                      Icons.arrow_upward,
                      color: appWhiteColor,
                      size: 15,
                    ),
        ],
      ),
    );
  }
}
