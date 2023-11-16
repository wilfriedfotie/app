import 'package:LASYLAB/core/components/bottomBar/bottomNavBar.dart';
import 'package:LASYLAB/core/components/bottomBar/navBarItemClass.dart';
import 'package:LASYLAB/core/components/images.dart';
import 'package:LASYLAB/feature/activities/presentation/pages/activities.dart';
import 'package:LASYLAB/feature/courses/presentation/page/home.dart';
import 'package:flutter/material.dart';

import '../feature/chat/presentation/pages/chat_page.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int selectedIndex = 0;
  late PageController pageController;
  List<NavBarItem> _navBarItem = [
    NavBarItem(
        id: 0,
        svg: Images.home_icon,
        onSelected: () {
          print("view the page : 1");
        }),
    NavBarItem(
        id: 1,
        svg: Images.activity_icon,
        onSelected: () {
          print("view the page : 2");
        }),
    NavBarItem(
        id: 2,
        svg: Images.chat_icon,
        onSelected: () {
          print("view the page : 3");
        })
  ];

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: (id) {
          print("the page id : $id");
        },
        allowImplicitScrolling: true,
        scrollDirection: Axis.horizontal,
        pageSnapping: true,
        children: [
          HomePage(),
          ActivitiesPage(),
          ChatPage(),
          //ResearchPage(),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        defaultSelectedIndex: selectedIndex,
        iconList: _navBarItem,
        pageController: pageController,
      ),
    );
  }
}
