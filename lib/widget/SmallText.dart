import 'package:flutter/cupertino.dart';
import '../utils/Dimensions.dart' as Dimensions;

class SmallText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  double height;
  SmallText(
      {Key? key,
      this.color = const Color(0xFFAAAAAA),
      required this.text,
      this.size = 12,
      this.height = 1.2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontFamily: 'Roboto',
          fontSize: Dimensions.fontSize(size),
          height: Dimensions.height(height)),
    );
  }
}
