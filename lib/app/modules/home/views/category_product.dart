import 'package:craftsman/app/modules/home/controllers/category_product_controller.dart';
import 'package:craftsman/app/modules/home/views/widgets/load_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryProductPage extends GetView<CategoryProductController> {
  final categoryLogic = Get.put(CategoryProductController());

  @override
  Widget build(BuildContext context) {
    var homeList = HomeList.homeList; //HomeList.homeList;
    return Container(
      child: GridView(
        padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: List<Widget>.generate(
          homeList.length,
          (int index) {
            final int count = homeList.length;
            final Animation<double> animation =
                Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                parent: categoryLogic.animationController,
                curve: Interval((1 / count) * index, 1.0,
                    curve: Curves.fastOutSlowIn),
              ),
            );
            categoryLogic.animationController.forward();
            // return HomeListView(
            //   animation: animation,
            //   animationController: categoryLogic.animationController,
            //   listData: homeList[index],
            //   callBack: () {
            //     // in the go to mechant detail page.
            //     print("to next detail page");
            //   },
            // );
            return ProductItem();
          },
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: categoryLogic.multiple ? 2 : 1,
            mainAxisSpacing: 15.0,
            crossAxisSpacing: 15.0,
            childAspectRatio: 166.0 / 250.0 //1.5,
            ),
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var border = BorderSide(color: Color(0xFF999999));
    var width = (Get.width / 2.0 - 18.0);
    var height = (width * 173.0 / 166.0);
    return Card(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      shadowColor: Color(0xFFF2F4F5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LoadImage(
              "https://img14.360buyimg.com/n1/jfs/t5770/201/7504946222/116240/8480d81a/59716aafNd5d04fab.jpg",
              cacheWidth: width.toInt(),
              cacheHeight: height.toInt()),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(left: 8),
                child: Container(
                  padding: EdgeInsets.only(left: 5, right: 5),
                  color: Color(0xFFEC6C4D),
                  child: Text(
                    '热销',
                    style: TextStyle(color: Colors.white, fontSize: 8.5),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 8),
                child: Text(
                  '山东烟台大樱桃',
                  style: TextStyle(
                      color: Color(0xFF333333),
                      fontSize: 13,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 6,
          ),
          Container(
            padding: EdgeInsets.only(left: 8),
            child: Container(
              padding: EdgeInsets.all(1),
              decoration: BoxDecoration(
                border: Border(
                  top: border,
                  left: border,
                  right: border,
                  bottom: border,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                '破损包退换',
                style: TextStyle(
                  color: Color(0xFF999999),
                  fontSize: 11,
                ),
              ),
            ),
          ),
          SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(left: 8),
                child: RichText(
                    text: TextSpan(
                  children: [
                    TextSpan(
                      text: "¥",
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
                )),
              ),
              Container(
                padding: EdgeInsets.only(right: 8),
                child: Text(
                  "已售20万+件",
                  style: TextStyle(
                    fontSize: 10,
                    color: Color(0xFFBFBEBE),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HomeListView extends StatelessWidget {
  const HomeListView(
      {Key? key,
      this.listData,
      this.callBack,
      this.animationController,
      this.animation})
      : super(key: key);

  final HomeList? listData;
  final VoidCallback? callBack;
  final AnimationController? animationController;
  final Animation<double>? animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation!,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 50 * (1.0 - animation!.value), 0.0),
            child: AspectRatio(
              aspectRatio: 166.0 / 250.0,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: <Widget>[
                    Positioned.fill(
                      child: LoadImage('Bitmap'),
                      // Image.asset(
                      //   listData!.imagePath,
                      //   fit: BoxFit.cover,
                      // ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        splashColor: Colors.grey.withOpacity(0.2),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(4.0)),
                        onTap: callBack,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class HomeList {
  HomeList({
    this.navigateScreen,
    this.imagePath = '',
  });

  Widget? navigateScreen;
  String imagePath;

  static List<HomeList> homeList = [
    HomeList(
      imagePath: 'Bitmap',
      // navigateScreen: IntroductionAnimationScreen(),
    ),
    HomeList(
      imagePath: 'Bitmap',
      // navigateScreen: HotelHomeScreen(),
    ),
    HomeList(
      imagePath: 'Bitmap',
      // navigateScreen: FitnessAppHomeScreen(),
    ),
    HomeList(
      imagePath: 'Bitmap',
      // navigateScreen: DesignCourseHomeScreen(),
    ),
    HomeList(
      imagePath: 'Bitmap',
      // navigateScreen: DesignCourseHomeScreen(),
    ),
    HomeList(
      imagePath: 'Bitmap',
      // navigateScreen: DesignCourseHomeScreen(),
    ),
  ];
}
