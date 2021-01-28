import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jd_web/widgets/green_text_container.dart';
import 'package:jd_web/widgets/slide_and_fade.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeHero extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizeInfo) {
      return ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 1200),
        child: Padding(
          padding: const EdgeInsets.only(top: 64, left: 32, right: 32),
          child: Row(
            mainAxisAlignment: sizeInfo.isDesktop
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.center,
            children: [
              sizeInfo.isDesktop
                  ? _buildLeft()
                  : Padding(
                      padding: EdgeInsets.only(bottom: 64),
                      child: _buildLeft(),
                    ),
              sizeInfo.isDesktop ? _buildRight() : Container(),
            ],
          ),
        ),
      );
    });
  }

  _buildLeft() {
    return SlideAndFade(
      direction: SlideDirection.Left,
      withSlide: true,
      delay: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GreenTextContainer(title: "I AM A"),
          SizedBox(height: 16),
          Text(
            "Mobile \nDeveloper",
            style: GoogleFonts.firaCode()
                .copyWith(fontSize: 48, color: Colors.white.withOpacity(0.9)),
          ),
          SizedBox(height: 16),
          Text(
            "I build mobile and web apps using Flutter",
            style: TextStyle(color: Colors.white38),
          ),
          Text(
            "I also built this website using Flutter!",
            style: TextStyle(
              color: Colors.greenAccent,
              // fontWeight: FontWeight.w300,
            ),
          )
        ],
      ),
    );
  }

  _buildRight() {
    return SlideAndFade(
      delay: 5,
      withSlide: true,
      direction: SlideDirection.Right,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: 450,
          child: Image(
            fit: BoxFit.fitWidth,
            image: AssetImage('assets/images/jdplanet.png'),
          ),
        ),
      ),
    );
  }
}
