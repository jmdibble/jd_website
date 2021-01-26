import 'package:flutter/material.dart';
import 'package:jd_web/home/home_page.dart';
import 'package:jd_web/layout/app_bar.dart';
import 'package:jd_web/layout/footer.dart';
import 'package:jd_web/widgets/drawer_menu.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Layout extends StatelessWidget {
  final ScrollController cont = ScrollController();

  final GlobalKey skillsKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizeInfo) {
      return Scaffold(
        endDrawer: !sizeInfo.isDesktop ? DrawerMenu() : null,
        appBar: HomeAppBar(onSelectSkills: onSelectSkills),
        body: SingleChildScrollView(
          controller: cont,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HomePage(skillsKey: skillsKey),
              Footer(),
            ],
          ),
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
