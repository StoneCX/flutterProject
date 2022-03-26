import 'package:craftsman/app/modules/home/views/widgets/load_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class TopAnouncement extends StatelessWidget {
  const TopAnouncement({
    Key? key,
    bool? showTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 215,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [Color(0x2E3F6BF8), Color(0x003F6BF8)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        tileMode: TileMode.clamp,
      )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SafeArea(
            child: Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
              children: [
              TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.only(left: 17),
                  alignment: Alignment.centerLeft,
                ),
                onPressed: () {
                  // Get.to(HomeView());
                  Get.back();
                },
                child: LoadImage(
                  "left-arrow-key",
                  width: 17,
                  height: 17,
                ),
              ),
            ],),
          ),
          Spacer(),
          Text(
            "登录精匠",
            style: TextStyle(
                fontFamily: "PingFangSC",
                fontSize: 20,
                color: Color(0xFF333333)),
          ),
          SizedBox(
            height: 14,
          ),
          Text(
            "验证即登录，未注册则自动创建新账号",
            style: TextStyle(
                fontFamily: "PingFangSC",
                fontSize: 14,
                color: Color(0xFF999999)),
          ),
          SizedBox(height: 13),
        ],
      ),
    );
  }
}
