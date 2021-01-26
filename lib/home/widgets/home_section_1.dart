import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jd_web/theme/colors.dart';
import 'package:jd_web/widgets/green_text_container_small.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeSection1 extends StatelessWidget {
  HomeSection1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizeInfo) {
      return Container(
        width: MediaQuery.of(context).size.width,
        color: JDColors.offBlack,
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 1200),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 128, horizontal: 32),
              child: sizeInfo.isDesktop
                  ? Row(
                      children: [
                        Flexible(
                          child: _buildIntro(),
                        ),
                        SizedBox(width: 64),
                        Flexible(
                          child: _buildSkills(),
                        )
                      ],
                    )
                  : Column(
                      children: [
                        _buildIntro(),
                        SizedBox(height: 50),
                        Divider(
                          color: Colors.greenAccent.withOpacity(0.1),
                          thickness: 1,
                          indent: 64,
                          endIndent: 64,
                        ),
                        SizedBox(height: 50),
                        _buildSkills(),
                      ],
                    ),
            ),
          ),
        ),
      );
    });
  }

  _skillSection({String title, IconData icon, String desc, bool isBottom}) {
    return Container(
      padding: !isBottom ? EdgeInsets.only(bottom: 16) : EdgeInsets.only(),
      decoration: BoxDecoration(
        border: !isBottom
            ? Border(
                bottom: BorderSide(color: Colors.greenAccent),
              )
            : Border(),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: GoogleFonts.firaCode(
                    fontSize: 16, color: Colors.greenAccent),
              ),
              SizedBox(width: 10),
              Icon(
                icon,
                color: Colors.greenAccent,
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            desc,
            style:
                TextStyle(color: Colors.white70, fontWeight: FontWeight.w200),
          ),
        ],
      ),
    );
  }

  _buildIntro() {
    return Container(
      padding: EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "SKILLS",
            style: TextStyle(
                color: Colors.greenAccent,
                fontWeight: FontWeight.w400,
                fontSize: 14),
          ),
          SizedBox(height: 16),
          Text(
            "I began my journey designing and building websites in my spare time, and it's what initially gave me the spark to code. Building them myself meant I developed a love for UI design and I quickly came to realise I wanted to be a front-end developer. From then on I immersed myself in various languages and frameworks until settling on mobile development using Flutter",
            style:
                TextStyle(color: Colors.white70, height: 1.6, letterSpacing: 1),
          ),
          SizedBox(height: 32),
          Wrap(
            direction: Axis.horizontal,
            children: [
              SmallGreenTextContainer(title: "FLUTTER", paddingVertical: 8),
              SizedBox(width: 8),
              SmallGreenTextContainer(title: "FIREBASE", paddingVertical: 8),
              SizedBox(width: 8),
              SmallGreenTextContainer(title: "PYTHON", paddingVertical: 8),
              SizedBox(width: 8),
              SmallGreenTextContainer(title: "JAVASCRIPT", paddingVertical: 8),
              SizedBox(width: 8),
              SmallGreenTextContainer(
                  title: "PRODUCT MGMT", paddingVertical: 8),
              SizedBox(width: 8),
            ],
          ),
        ],
      ),
    );
  }

  _buildSkills() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _skillSection(
              title: "Mobile Development",
              desc:
                  "With experience building apps including, payments ordering systems, maps, authentication, social media, camera and native device interactions",
              icon: Icons.phone_android_rounded,
              isBottom: false),
          _skillSection(
              title: "Architecture",
              desc: "Write some desc",
              icon: Icons.table_chart_rounded,
              isBottom: false),
          _skillSection(
              title: "Design",
              desc: "Write some desc",
              icon: Icons.edit_outlined,
              isBottom: true),
        ],
      ),
    );
  }
}
