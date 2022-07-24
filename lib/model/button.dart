import 'package:flutter/material.dart';

class CustomButton {
  static int disableButtonColor = 0xFF43b2d1;

  static ElevatedButton customButton(
      BuildContext context, String text, onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.resolveWith((Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            return Theme.of(context).colorScheme.primary.withOpacity(0.5);
          } else if (states.contains(MaterialState.disabled)) {
            return Color(disableButtonColor);
          }
          return null;
        }),
      ),
      child: Text(text),
    );
  }

  static Function()? onPressedByCondition(bool condition, func) {
    return condition ? null : () => func();
  }
}
