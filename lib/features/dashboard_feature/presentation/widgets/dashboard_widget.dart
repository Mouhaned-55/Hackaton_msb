import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hackaton_msb/core/tab_layout.dart';
import 'package:hackaton_msb/features/dashboard_feature/domain/entities/picking_entity.dart';
import 'package:hackaton_msb/features/dashboard_feature/domain/entities/stock_entity.dart';

class DashBoardWidget extends StatelessWidget {
  final List<Picking>? picking;
  final List<Stock>? stock;

  const DashBoardWidget({
    Key? key,
    this.picking,
    this.stock, // make stock optional and nullable
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: EdgeInsets.only(left: 85.w),
          child: const Text(
            "Home Page",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500,
              fontSize: 20,
              color: Color(0xFF252525),
              fontFamily: "Tajawal",
            ),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 253, 249, 249),
        elevation: 0,
        leading: IconButton(
          icon: Container(
            child: SvgPicture.asset(
              "assets/icons/sidebar.svg",
            ),
          ),
          onPressed: () {
            // scaffoldKey.currentState?.openDrawer();
          },
        ),
      ),
      body: TabLayout(
        tabs: myTabs,
        tabsContent: [
          Column(
            children: [
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: picking?.length ?? 10,
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(),
                  itemBuilder: (BuildContext context, int index) {
                  /*  var percentage =
                        ((picking![index].quantite / picking![index].capacite) *
                                100)
                            .round();*/
                    return ListTile(
                      title:
                          Text('Emplacement : ${picking?[index].emplacement}'),
                      subtitle: Text('Article :${picking?[index].article}'),
                      trailing: Text(
                  "percentage%"),
                      onTap: () {
                        // do something when the tile is tapped
                      },
                    );
                  },
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: stock!.length,
              separatorBuilder: (BuildContext context, int index) => Divider(),
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text('Emplacement : ${stock![index].emplacement}'),
                  subtitle: Text('Article :${stock![index].article}'),
                  onTap: () {
                    // do something when the tile is tapped
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

final List<String> myTabs = ["Picking", "Stockage"];
