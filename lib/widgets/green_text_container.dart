import 'package:flutter/material.dart';
import 'package:jd_web/theme/colors.dart';

class GreenTextContainer extends StatelessWidget {
  final String title;

  const GreenTextContainer({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.greenAccent,
        borderRadius: BorderRadius.all(
          Radius.circular(2),
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Text(
        title,
        style: TextStyle(
          color: JDColors.offBlue,
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
      ),
    );
    ;
  }
}
