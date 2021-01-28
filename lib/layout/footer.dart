import 'package:flutter/material.dart';
import 'package:jd_web/icons/jd_icons.dart';
import 'package:jd_web/theme/colors.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'dart:html' as html;

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizeInfo) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: 200,
        color: JDColors.offBlack,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 1200),
              child: sizeInfo.isDesktop
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildLeading(sizeInfo),
                        _buildMiddle(),
                        _buildEnd(sizeInfo),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _buildLeading(sizeInfo),
                        SizedBox(height: 16),
                        _buildMiddle(),
                        _buildEnd(sizeInfo),
                      ],
                    ),
            ),
          ),
        ),
      );
    });
  }

  _buildLeading(SizingInformation sizeInfo) {
    return Row(
      mainAxisAlignment: sizeInfo.isDesktop
          ? MainAxisAlignment.start
          : MainAxisAlignment.center,
      children: [
        Text(
          "Josh ",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, letterSpacing: 1.5),
        ),
        Text(
          "Dibble",
          style: TextStyle(
              fontWeight: FontWeight.w100, fontSize: 18, letterSpacing: 1.5),
        ),
      ],
    );
  }

  _buildMiddle() {
    return Text(
      "2021 \u00a9 Josh Dibble. All rights reserved",
      style: TextStyle(color: Colors.white38),
    );
  }

  _buildEnd(SizingInformation sizeInfo) {
    return Row(
      mainAxisAlignment: sizeInfo.isDesktop
          ? MainAxisAlignment.start
          : MainAxisAlignment.center,
      children: [
        IconButton(
            icon: Icon(
              JDIcons.mark_github,
              color: Colors.greenAccent,
            ),
            onPressed: () {
              html.window.open('https://www.github.com/jmdibble', 'new tab');
            }),
        IconButton(
            icon: Icon(
              JDIcons.linkedin_rect,
              color: Colors.greenAccent,
            ),
            onPressed: () {
              html.window
                  .open('https://www.linkedin.com/in/joshdibble93/', 'new tab');
            }),
      ],
    );
  }
}
