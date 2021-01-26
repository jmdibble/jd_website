import 'package:flutter/material.dart';
import 'package:jd_web/icons/jd_icons.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeAppBar extends PreferredSize {
  final Function onSelectSkills;

  HomeAppBar({this.onSelectSkills});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizeInfo) {
        return sizeInfo.isDesktop
            ? _buildDesktopAppBar()
            : _buildMobileAppBar();
      },
    );
  }

  _buildDesktopAppBar() {
    return AppBar(
      elevation: 0,
      toolbarHeight: 80,
      title: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 1200),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildLeading(),
            _buildMiddle(),
            _buildEnd(),
          ],
        ),
      ),
    );
  }

  _buildMobileAppBar() {
    return AppBar(
      elevation: 0,
      toolbarHeight: 80,
      title: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 1200),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildLeading(),
          ],
        ),
      ),
    );
  }

  _buildLeading() {
    return Row(
      children: [
        Text(
          "Josh ",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 22, letterSpacing: 1.5),
        ),
        Text(
          "Dibble",
          style: TextStyle(
              fontWeight: FontWeight.w100, fontSize: 22, letterSpacing: 1.5),
        ),
      ],
    );
  }

  _buildMiddle() {
    return Row(
      children: [
        FlatButton(
          onPressed: () {
            onSelectSkills();
          },
          child: Text(
            "Skills",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        FlatButton(
          onPressed: () {},
          child: Text(
            "Work",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        FlatButton(
          onPressed: () {},
          child: Text(
            "Contact",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  _buildEnd() {
    return Row(
      children: [
        FlatButton(
          onPressed: () {},
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                JDIcons.mark_github,
                color: Colors.white54,
                size: 18,
              ),
              SizedBox(width: 8),
              Text(
                "Github",
                style: TextStyle(color: Colors.white54),
              ),
            ],
          ),
        ),
        SizedBox(width: 8),
        FlatButton(
          onPressed: () {},
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                JDIcons.linkedin_rect,
                color: Colors.white54,
                size: 18,
              ),
              SizedBox(width: 8),
              Text(
                "LinkedIn",
                style: TextStyle(color: Colors.white54),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
