import 'package:flutter/material.dart';
import 'package:jd_web/theme/colors.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final Function onPressed;

  const PrimaryButton({
    Key key,
    this.label,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(400),
          ),
          color: Colors.greenAccent),
      child: RaisedButton(
        hoverElevation: 0,
        padding: EdgeInsets.symmetric(horizontal: 8),
        elevation: 0,
        onPressed: onPressed,
        color: Colors.transparent,
        child: Text(
          label,
          style: TextStyle(color: JDColors.offBlack),
        ),
      ),
    );
  }
}
