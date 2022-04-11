import 'package:craftsman/app/modules/home/controllers/home_controller.dart';
import 'package:craftsman/app/modules/home/views/category_product.dart';
import 'package:craftsman/app/modules/home/views/widgets/load_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class HomeView extends GetView<HomeController> {
  final homeLogic = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: Get.width, //MediaQuery.of(context).size.width,
            height: 88,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF3F6BF8), Color(0xFF73A4FC)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                // tileMode: TileMode.clamp,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    "秒杀产品",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      print("Clicked");
                    },
                    child: Text(
                      "更多",
                      style:
                          TextStyle(fontSize: 18.0, color: Color(0xFF999999)),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: Get.width,
            // height: 300,r
            padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  HotSaleItem(),
                  HotSaleItem(),
                  HotSaleItem(),
                  HotSaleItem(),
                  HotSaleItem(),
                  HotSaleItem(),
                ],
              ),
            ),
          ),
          Container(
            height: 8,
            color: Color(0xFFF2F4F5),
          ),
          // Stack(children: [
          //   Container(
          //     constraints: BoxConstraints(minHeight: 32),
          //     // height: 31,
          //     // padding: EdgeInsets.only(left: 10, right: 10, ),
          //     color: Colors.white,
          //     child: SingleChildScrollView(
          //       controller: ScrollController(initialScrollOffset: 100.0),
          //       scrollDirection: Axis.horizontal,
          //       child: Row(
          //         children: [
          //           tapItem("综合"),
          //           tapItem("裤子"),
          //           tapItem("衣服"),
          //           tapItem("夹克"),
          //           tapItem("卫衣"),
          //           tapItem("短袖"),
          //           tapItem("内裤"),
          //           tapItem(""),
          //         ],
          //       ),
          //     ),
          //   ),
            // Align(
            //   alignment: Alignment.bottomRight,
            //   child: Container(
            //     constraints: BoxConstraints(minHeight: 32, maxHeight: 32),
            //     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            //     decoration: BoxDecoration(
            //       color: Colors.white,
            //       boxShadow: [
            //         BoxShadow(
            //           color: Color(0xFFF2F4F5).withOpacity(0.8),
            //           spreadRadius: 3,
            //           blurRadius: 2,
            //           offset: Offset(0, 0), // changes position of shadow
            //         ),
            //       ],
            //     ),
            //     child: Icon(
            //       Icons.menu_outlined,
            //     ),
            //   ),
            // ),
          //   DefaultTabController(
          //     length: items.length,
          //     child: TabBar(tabs: createItems(items),),
          //   ),
          // ]),
          Stack(
            children: [Container(
              color: Colors.white,
              child: TabBar(
                tabs: createItems(homeLogic.items),
                controller: homeLogic.tabController,
                isScrollable: true,
                indicatorColor: Color(0xFFE65C5C),
                indicatorPadding: EdgeInsets.only(left: 21, right: 21, bottom: 12),
                indicatorWeight: 3.0,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                constraints: BoxConstraints(minHeight: 34, maxHeight: 34),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFF2F4F5).withOpacity(0.8),
                      spreadRadius: 3,
                      blurRadius: 2,
                      offset: Offset(0, 0), // changes position of shadow
                    ),
                  ],
                ),
                child: Icon(
                  Icons.menu_outlined,
                ),
              ),
            ),
            ]
          ),
          Container(
            width: Get.width,
            height: Get.height,
            child: TabBarView(
              
              children: createContentPage(homeLogic.items),
              controller: homeLogic.tabController,
            ),
          ),
        ],
      ),
    ));
  }

  Widget productsItem() {
    return Card(
      child: Column(
        children: [
          LoadImage(
              "https://img14.360buyimg.com/n1/jfs/t5770/201/7504946222/116240/8480d81a/59716aafNd5d04fab.jpg"),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 5, right: 5),
                color: Color(0xFFEC6C4D),
                child: Text(
                  '热销',
                  style: TextStyle(color: Colors.white, fontSize: 8.5),
                ),
              ),
              Text(
                '山东烟台大樱桃',
                style: TextStyle(color: Color(0xFF333333), fontSize: 13),
              ),
            ],
          ),
          Text(
            '破损包退换',
            style: TextStyle(
              color: Color(0x999999),
              fontSize: 11,
            ),
          )
        ],
      ),
    ); // return Text('data');
  }

  void onTabTapped(int index) {
    homeLogic.currentIndex.value = index;
  }

  List<Widget> createContentPage(List<String> titles) {
    List<Widget> list = [];
    for (int i = 0; i < titles.length; i++) {
      list.add(CategoryProductPage());
    }
    return list;
  }

  List<Widget> createItems(List<String> titles) {
    List<Widget> list = [];
    for (int i = 0; i < titles.length; i++) {
      list.add(Container(
          padding: EdgeInsets.only(top: 7, bottom: 7),
          child: Text(
            titles[i],
            style: TextStyle(fontSize: 15, color: Color(0xFF333333)),
          )));
    }
    return list;
  }
}

class HotSaleItem extends StatelessWidget {
  const HotSaleItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          LoadImage('Bitmap'),
          SizedBox(height: 12),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 5, right: 5),
                color: Color(0xFFEC6C4D),
                child: Text(
                  '热销',
                  style: TextStyle(color: Colors.white, fontSize: 8.5),
                ),
              ),
              Text(
                '山东烟台大樱桃',
                style: TextStyle(color: Color(0xFF333333), fontSize: 13),
              ),
            ],
          ),
          SizedBox(height: 7),
          Text(
            '¥78/68 市场价',
            style: TextStyle(
              fontSize: 11,
              color: Color(0xFF999999),
            ),
          ),
          SizedBox(height: 3),
          RichText(
              text: TextSpan(
            children: [
              TextSpan(
                text: "秒杀价",
                style: TextStyle(
                  fontSize: 11,
                  color: Color(0xFFFF4142),
                ),
              ),
              TextSpan(
                text: "58",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFFFF4142),
                ),
              ),
              TextSpan(
                text: ".00",
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFFFF4142),
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
