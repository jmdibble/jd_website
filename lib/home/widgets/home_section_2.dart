import 'package:flutter/material.dart';
import 'package:jd_web/theme/colors.dart';
import 'package:jd_web/widgets/green_text_container.dart';
import 'package:jd_web/widgets/slide_and_fade.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeSection2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizeInfo) {
      return Container(
        padding: EdgeInsets.only(top: 32, bottom: 32),
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 1200),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "WORK",
                    style: TextStyle(
                        color: Colors.greenAccent,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                  SizedBox(height: 16),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Wrap(
                      alignment: sizeInfo.isDesktop
                          ? WrapAlignment.spaceBetween
                          : WrapAlignment.center,
                      direction: Axis.horizontal,
                      runSpacing: 32,
                      children: [
                        SlideAndFade(
                          direction: SlideDirection.Bottom,
                          delay: 12,
                          withSlide: true,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              _workImage(imagePath: "assets/images/try1.png"),
                              SizedBox(height: 16),
                              GreenTextContainer(title: "CGI CATERING"),
                            ],
                          ),
                        ),
                        sizeInfo.isDesktop ? SizedBox(width: 32) : Container(),
                        SlideAndFade(
                          direction: SlideDirection.Bottom,
                          delay: 12,
                          withSlide: true,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              _workImage(imagePath: "assets/images/try2.png"),
                              SizedBox(height: 16),
                              GreenTextContainer(title: "WANDER"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  _workImage({String imagePath}) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      height: 400,
      width: 400,
      decoration: BoxDecoration(
          color: JDColors.offBlack,
          borderRadius: BorderRadius.all(
            Radius.circular(1000),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.greenAccent.withOpacity(0.2),
              blurRadius: 10,
              spreadRadius: 0,
            ),
          ]),
      child: Image(
        image: AssetImage(imagePath),
      ),
    );
  }
}
