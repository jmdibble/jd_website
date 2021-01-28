import 'package:flutter/material.dart';
import 'package:flutter_web_scrollbar/flutter_web_scrollbar.dart';
import 'package:jd_web/home/home_page.dart';
import 'package:jd_web/layout/app_bar.dart';
import 'package:jd_web/layout/footer.dart';
import 'package:jd_web/widgets/drawer_menu.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Layout extends StatefulWidget {
  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  final ScrollController cont = ScrollController();
  final GlobalKey skillsKey = GlobalKey();

  double elevation = 0;

  @override
  void initState() {
    cont.addListener(() {
      if (cont.offset < 30) {
        setState(() {
          elevation = 0;
        });
      } else {
        setState(() {
          elevation = 3;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizeInfo) {
      return Scaffold(
        endDrawer: !sizeInfo.isDesktop ? DrawerMenu() : null,
        appBar:
            HomeAppBar(onSelectSkills: onSelectSkills, elevation: elevation),
        body: Stack(
          children: [
            Scrollbar(
              isAlwaysShown: true,
              thickness: 10,
              radius: Radius.circular(100),
              controller: cont,
              child: SingleChildScrollView(
                controller: cont,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    HomePage(skillsKey: skillsKey),
                    Footer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  void onSelectSkills() {
    RenderBox box = skillsKey.currentContext.findRenderObject();

    Offset offset = box.localToGlobal(
      Offset(0, -80),
    );

    cont.animateTo(
      offset.dy,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }
}
