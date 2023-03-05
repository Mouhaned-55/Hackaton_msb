import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackaton_msb/features/dashboard_feature/presentation/pages/dashboard_page.dart';

import '../features/dashboard_feature/presentation/widgets/dashboard_widget.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  _BottomNavBar createState() => _BottomNavBar();
}

class _BottomNavBar extends State<BottomNavBar> {
  int _currentIndex = 1;
  List<Widget> body = const [
    Icon(Icons.diamond),
    Icon(Icons.wallet),
    Icon(Icons.home),
  ];

  @override
  Widget build(BuildContext context) {
    Color unselectedColor = Color(0xFF878F9D);
    Color selectedColor = Color(0xFF59caba);

    const List<Widget> _widgetOptions = <Widget>[
      Text("Search here"),
      DashboardPage(),
      Text('Live Page',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    ];

    return Scaffold(
        body: _widgetOptions.elementAt(_currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: unselectedColor,
          selectedItemColor: selectedColor,
          currentIndex: _currentIndex,
          onTap: (int newIndex) {
            setState(() {
              _currentIndex = newIndex;
            });
          },
          items: [
            BottomNavigationBarItem(
              activeIcon: Container(
                child: SvgPicture.asset(
                  "assets/icons/home.svg",
                  color: selectedColor,
                ),
              ),
              label: "History",
              icon: Container(
                child: SvgPicture.asset(
                  "assets/icons/home.svg",
                ),
              ),
            ),
            BottomNavigationBarItem(
              activeIcon: Container(
                child: SvgPicture.asset(
                  "assets/icons/home.svg",
                  color: selectedColor,
                ),
              ),
              label: "Home ",
              icon: Container(
                child: SvgPicture.asset(
                  "assets/icons/home.svg",
                ),
              ),
            ),
            BottomNavigationBarItem(
              activeIcon: Container(
                child: SvgPicture.asset(
                  "assets/icons/home.svg",
                  color: selectedColor,
                ),
              ),
              label: "Profile",
              icon: Container(
                child: SvgPicture.asset(
                  "assets/icons/home.svg",
                ),
              ),
            ),
          ],
        ));
  }
}
