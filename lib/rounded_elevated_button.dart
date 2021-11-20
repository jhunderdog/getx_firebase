import 'package:flutter/material.dart';
import 'package:getx_firebase/configuration.dart';

class RoundedElevatedButton extends StatelessWidget {
  final String? title;
  final onPressed, padding;

  const RoundedElevatedButton({
    Key? key,
    @required this.title,
    @required this.onPressed,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        title!,
        style: TextStyle(
          fontSize: Configuration.screenWidth! * 0.05,
        ),
      ),
      style: ElevatedButton.styleFrom(
          padding: padding,
          primary: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.0),
          )),
    );
  }
}
