import 'package:flutter/material.dart';
import 'package:jd_web/home/widgets/home_hero.dart';
import 'package:jd_web/home/widgets/home_section_1.dart';
import 'package:jd_web/home/widgets/home_section_2.dart';
import 'package:jd_web/theme/colors.dart';

class HomePage extends StatelessWidget {
  final GlobalKey skillsKey;

  HomePage({this.skillsKey});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        HomeHero(),
        HomeSection1(key: skillsKey),
        HomeSection2(),
      ],
    );
  }
}
