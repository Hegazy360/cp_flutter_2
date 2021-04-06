import 'package:bodyo_test/CustomAppBar.dart';
import 'package:bodyo_test/CustomNavBarWidget.dart';
import 'package:bodyo_test/RecipePage.dart';
import 'package:bodyo_test/StatItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'SoinSansNeue'),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 3);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            CustomAppBar(),
          ];
        },
        body: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              Container(
                color: Colors.white,
                padding: const EdgeInsets.only(
                    left: 10.0, right: 10.0, top: 15.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      StatItem(
                          iconPath: 'assets/images/heart.png',
                          title: '85',
                          subtitle: 'likes'),
                      StatItem(
                          iconPath: 'assets/images/calories.png',
                          title: '451',
                          subtitle: 'kcal'),
                      StatItem(
                          iconPath: 'assets/images/clock.png',
                          title: '19',
                          subtitle: 'mins')
                    ]),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Scaffold(
                    backgroundColor: Colors.white,
                    bottomNavigationBar: PersistentTabView.custom(
                      context,
                      controller: _controller,
                      screens: _buildScreens(),
                      itemCount: 5,
                      customWidget: CustomNavBarWidget(
                        items: _navBarsItems(),
                        onItemSelected: (index) {
                          setState(() {
                            _controller.index = index;
                          });
                        },
                        selectedIndex: _controller.index,
                      ),
                      confineInSafeArea: true,
                      backgroundColor: Colors.white,
                      handleAndroidBackButtonPress: true,
                      resizeToAvoidBottomInset: true,
                      stateManagement: true,
                      hideNavigationBarWhenKeyboardShows: true,
                      margin: EdgeInsets.all(0.0),
                      bottomScreenMargin: 0.0,
                      screenTransitionAnimation: ScreenTransitionAnimation(
                        animateTabTransition: true,
                        curve: Curves.ease,
                        duration: Duration(milliseconds: 200),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildScreens() {
    return [
      Container(),
      Container(),
      Container(),
      RecipePage(),
      Container(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          "assets/images/dashboard.svg",
          color: Color(0xFF20CAD1),
        ),
        inactiveIcon: SvgPicture.asset("assets/images/dashboard.svg"),
        title: "Dashboard",
        contentPadding: 0,
        activeColorPrimary: Color(0xFF20CAD1),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          "assets/images/kettlebell.svg",
          color: Color(0xFF20CAD1),
        ),
        inactiveIcon: SvgPicture.asset(
          "assets/images/kettlebell.svg",
        ),
        title: ("Exercises"),
        activeColorPrimary: Color(0xFF20CAD1),
      ),
      PersistentBottomNavBarItem(
          icon: Image.asset("assets/images/navigation_action.png"),
          activeColorPrimary: Colors.transparent),
      PersistentBottomNavBarItem(
        icon: Image.asset(
          "assets/images/book.png",
        ),
        inactiveIcon: Image.asset(
          "assets/images/book.png",
          color: Colors.black,
        ),
        title: ("Recipes"),
        activeColorPrimary: Color(0xFF20CAD1),
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset("assets/images/profile_picture.png"),
        title: ("Profile"),
        activeColorPrimary: Color(0xFF20CAD1),
      ),
    ];
  }
}
