import 'package:flutter/material.dart';

// local imports
import './widget/appbar/appbar_content.dart';
import '../../../config/theme/responsiveness.dart';
import '../../../config/theme/layout.dart';
import '../../../movies/presentation/pages/movies.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);
  @override
  State<DashboardScreen> createState() => _DashboardScreen();
}

class _DashboardScreen extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final scaffoldKey = GlobalKey<ScaffoldState>();
    // gives the font scaling for
    // different screen sizes
    final responsiveFont = ScaleUi.responsiveFontSize(context, 20.0);
    //  fetches the screen Media query from context11
    //for responsiveness in the ui
    ScaleUi().init(context);

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          leading: AppBarContent(
            drawer: scaffoldKey,
          ),
          leadingWidth: width,
          bottom: TabBar(
              padding: EdgeInsets.symmetric(
                  horizontal: ScaleUi.safeBlockHorizontal * 6),
              isScrollable: true,
              indicator: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(80),
                  right: Radius.circular(80),
                ),
              ),
              labelStyle: TextStyle(
                color: Colors.black,
                fontSize: responsiveFont,
                fontWeight: FontWeight.w400,
              ),
              unselectedLabelStyle: TextStyle(
                color: const Color.fromARGB(214, 158, 158, 158),
                fontSize: responsiveFont,
                fontWeight: FontWeight.normal,
              ),
              tabs: const [
                Tab(text: 'In Theather'),
                Tab(text: 'Box Office'),
                Tab(text: 'Commercial'),
                Tab(text: 'Movies'),
                Tab(text: 'Drama'),
              ]),
        ),
        drawer: Drawer(
          width: width * 0.8,
          child: const Text('Testing'),
        ),
        body: const Layout(
          child: MovieScreen(),
        ),
      ),
    );
  }
}
