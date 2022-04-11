import 'package:craftsman/app/modules/home/controllers/mine_controller.dart';
import 'package:craftsman/app/modules/home/views/login_view.dart';
import 'package:craftsman/app/modules/home/views/widgets/load_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MineView extends GetView<MineController> {
  final padding = 15.0;
  final innerPadding = 8.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFF6F7FB),
        child: Stack(
          children: [
            ClipOval(
              clipper: MyClipper(),
              child: Container(
                height: 211,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF3F6BF8), Color(0xFF73A4FC)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    tileMode: TileMode.clamp,
                  ),
                ),
              ),
            ),
            Positioned(
              // left: 15,
              top: 95,
              child: Stack(
                children: [
                  Container(
                    child: Row(
                      children: [
                        SizedBox(width: 15),
                        LoadImage("avatar", width: 40, height: 40),
                        SizedBox(width: 9),
                        Text(
                          '幼稚少女',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),

            /// 我的订单块
            Positioned(
              left: padding,
              top: 151,
              child: Container(
                height: 198,
                width: Get.width - padding * 2,
                // padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9.0),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    // SizedBox(height: padding),
                    Container(
                      height: 44,
                      child: TextButton(
                        style: TextButton.styleFrom(padding: EdgeInsets.all(0)),
                        onPressed: () {
                          print("我的订单 clicking。。。。 go to myOrderPage");
                        },
                        child: Row(
                          children: [
                            SizedBox(width: innerPadding),
                            Text(
                              "我的订单",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF000000)),
                            ),
                            Spacer(),
                            LoadAssetImage("right_next"),
                            SizedBox(width: innerPadding),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: innerPadding),
                      height: 1,
                      child: Container(
                        color: Color(0xFFE3E3E3),
                      ),
                    ),
                    SizedBox(
                      height: 8.5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        OrderButton(
                            imageUrl: "mine_order_wait_pay", title: "待支付"),
                        OrderButton(
                            imageUrl: "mine_order_wait_deliver", title: "待发货"),
                        OrderButton(
                            imageUrl: "mine_order_wait_sign", title: "待收货"),
                        OrderButton(
                            imageUrl: "mine_order_complete", title: "已完成"),
                        OrderButton(
                            imageUrl: "mine_order_after_service",
                            title: "退款/售后"),
                      ],
                    ),
                    SizedBox(height: 13),
                    LogisticsInformation(innerPadding: innerPadding),
                  ],
                ),
              ),
            ),
            Positioned(
                left: padding,
                top: 357,
                child: Container(
                  height: 148,
                  width: Get.width - padding * 2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9.0),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RowButton(
                        iconUrl: 'mine_all',
                        title: "全部订单",
                        onPressed: () {
                          print("全部订单 clicking......");
                        },
                      ),
                      RowButton(
                        iconUrl: 'mine_notify',
                        title: "消息提醒",
                        onPressed: () {
                          print("消息提醒 clicking......");
                        },
                      ),
                      RowButton(
                        iconUrl: 'mine_setting',
                        title: "设置",
                        onPressed: () {
                          print("设置 clicking......");
                        },
                      ),
                    ],
                  ),
                )),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                // color: Colors.blue,
                child: TextButton(
                  onPressed: () {
                    Get.to(() => LoginView());
                  },
                  child: Text("go to login"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RowButton extends StatelessWidget {
  const RowButton(
      {Key? key,
      required this.iconUrl,
      required this.title,
      required this.onPressed})
      : super(key: key);
  final String iconUrl;
  final String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    double innerPadding = 8;
    return Container(
      height: 44,
      child: TextButton(
        style: TextButton.styleFrom(padding: EdgeInsets.all(0)),
        onPressed: onPressed,
        child: Row(
          children: [
            SizedBox(width: innerPadding),
            LoadImage(iconUrl, width: 20, height: 20),
            Text(
              title,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF000000)),
            ),
            Spacer(),
            LoadAssetImage("right_next"),
            SizedBox(width: innerPadding),
          ],
        ),
      ),
    );
  }
}

/// 物流信息
class LogisticsInformation extends StatelessWidget {
  const LogisticsInformation({
    Key? key,
    required this.innerPadding,
  }) : super(key: key);

  final double innerPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: innerPadding, right: innerPadding),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          color: Color(0x29C9CDDB),
        ),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                padding: EdgeInsets.all(10),
                child: LoadImage("Bitmap", height: 40, width: 40)),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: RichText(
                    text: TextSpan(
                        text: "待确认收货",
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xFFFF4142),
                        ),
                        children: [
                          TextSpan(
                            text: "2021-1-18 05:47:15",
                            style: TextStyle(
                              fontSize: 11,
                              color: Color(0xFF999999),
                            ),
                          )
                        ]),
                  ),
                ),
                Container(
                  child: Text(
                    "[嘉兴市]离开【嘉兴邮件处理中心】,下一站【上…",
                    style: TextStyle(
                      fontSize: 11,
                      color: Color(0xFF666666),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class OrderButton extends StatelessWidget {
  final String imageUrl;
  final String title;
  const OrderButton({Key? key, required this.imageUrl, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          print('my order buttons clicking.....');
        },
        child: Column(
          children: [
            LoadImage(imageUrl, width: 26, height: 21),
            SizedBox(height: 3),
            Text(
              title,
              style: TextStyle(
                fontSize: 9,
                color: Color(0xFF777777),
              ),
            ),
          ],
        ));
  }
}

// Define class MyClipper
class MyClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    // return Rect.fromCircle(center: const Offset(200, 100), radius: 250);
    // var padding = context.mediaQueryPadding();
    // center:圆心 offset:调整圆心位置 offset.x:手机左上角->手机左下角 为正，反之为负
    // offset.y:手机左上角->手机右上角 值为正，反之为负
    var topBackgroundWidth = Get.width;
    var topBackgroundHeight = 211.0;
    return Rect.fromCircle(
        center: Offset(topBackgroundWidth / 2.0, -topBackgroundHeight * 2.5),
        radius: (-topBackgroundHeight * 3.5).abs());
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return false;
  }
}
