import 'package:flutter/material.dart';

class TabLayout extends StatelessWidget {
  final List<String> tabs;
  final List<Widget> tabsContent;

  const TabLayout({super.key, required this.tabs, required this.tabsContent});

  //custom tabLayout
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.fromLTRB(17.0, 40.0, 17.0, 17.0),
        child: Column(
          children: [
            Container(
              height: 30,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(12.0)),
              child: TabBar(
                indicator: BoxDecoration(
                    color: Color(0xFF59caba),
                    borderRadius: BorderRadius.circular(12.0)),
                labelColor: Colors.white,
                unselectedLabelColor: const Color(0xff344054),
                tabs: tabs
                    .map((tab) => Tab(
                            child: Text(
                          tab,
                          style: const TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              height: 2.1,
                              fontFamily: "Tajawal"),
                          textAlign: TextAlign.center,
                        )))
                    .toList(),
              ),
            ),
            const SizedBox(height: 5),
            Expanded(
                child: TabBarView(
              children: tabsContent,
            )),
          ],
        ),
      )),
    );
  }
}
