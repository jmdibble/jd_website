import 'package:flutter/material.dart';
import 'package:jd_web/layout/layout.dart';
import 'package:jd_web/theme/theme.dart';
import 'package:jd_web/viewmodels/contact_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:firebase/firebase.dart' as fb;

void main() {
  ResponsiveSizingConfig.instance.setCustomBreakpoints(
    ScreenBreakpoints(desktop: 800, tablet: 550, watch: 200),
  );
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => ContactViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mobile Developer | Josh Dibble | Portfolio',
        theme: theme,
        home: Layout(),
      ),
    );
  }
}
