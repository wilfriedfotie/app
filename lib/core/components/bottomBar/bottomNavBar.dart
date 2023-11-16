import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../size_config.dart';
import '../styling.dart';
import 'navBarItemClass.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final List<NavBarItem> iconList;
  final int defaultSelectedIndex;
  final PageController pageController;

  CustomBottomNavigationBar(
      {required this.iconList,
      required this.defaultSelectedIndex,
      required this.pageController});

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;
  List<NavBarItem> _iconList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _selectedIndex = widget.defaultSelectedIndex;
    _iconList = widget.iconList;
  }

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      ..._iconList.map((e) => buildNavBarItem(item: e)).toList(),
    ]);
  }

  Widget buildNavBarItem({required NavBarItem item}) {
    final screenSize = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        setState(() {
          _selectedIndex = item.id;
        });
        widget.pageController.animateToPage(item.id,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeOutQuad);
        item.onSelected();
      },
      splashColor: AppTheme.primaryColor.withOpacity(0.3),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        height: dimensH(screenSize.height * .09, sm: screenSize.height * .07),
        width: MediaQuery.of(context).size.width / _iconList.length,
        decoration: item.id == _selectedIndex
            ? BoxDecoration(
                border: Border(
                  top: BorderSide(width: 4, color: AppTheme.primaryColor),
                ),
              )
            : BoxDecoration(),
        child: item.svg != null && item.svg != ""
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  item.svg ?? "",
                  color: item.id == _selectedIndex
                      ? AppTheme.primaryColor
                      : AppTheme.grayColor,
                ),
              )
            : Icon(
                item.icon,
                color: item.id == _selectedIndex
                    ? AppTheme.primaryColor
                    : AppTheme.grayColor,
              ),
      ),
    );
  }
}
