import '../utils/Dimensions.dart' as Dimensions;

import 'package:first_app_desktop/widget/SmallText.dart';
import 'package:flutter/material.dart';

class IconAndTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconcolor;
  const IconAndTextWidget(
      {Key? key,
      required this.icon,
      required this.text,
      required this.iconcolor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconcolor,
        ),
        SizedBox(
          width: Dimensions.width(5),
        ),
        SmallText(
          text: text,
        )
      ],
    );
  }
}
