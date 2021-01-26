import 'package:flutter/material.dart';
import 'package:jd_web/theme/colors.dart';

class SmallGreenTextContainer extends StatelessWidget {
  final String title;
  final double paddingVertical;
  final double paddingHorizontal;

  const SmallGreenTextContainer(
      {Key key,
      this.title,
      this.paddingVertical = 0,
      this.paddingHorizontal = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: paddingHorizontal, vertical: paddingVertical),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.greenAccent,
          borderRadius: BorderRadius.all(
            Radius.circular(2),
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
        child: Text(
          title,
          style: TextStyle(
            color: JDColors.offBlue,
            fontWeight: FontWeight.w400,
            fontSize: 10,
          ),
        ),
      ),
    );
    ;
  }
}
