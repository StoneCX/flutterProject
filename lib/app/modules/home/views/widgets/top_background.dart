import 'package:craftsman/app/modules/home/views/home_view.dart';
import 'package:craftsman/app/modules/home/views/widgets/load_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class TopBackground extends StatelessWidget {
  final String? title;
  const TopBackground({Key? key, this.title}) : super(key: key);

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
      child: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start, 
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
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: Stack(
                children: [Text(
                  
                  title ?? "", 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    
                    fontSize: 17, color: Color(0xff000000),),),
                ]),
            ),
            TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.only(left: 17),
                alignment: Alignment.centerLeft,
              ),
              onPressed: null,
              child: Text("")
            ),
          ]),
          SizedBox(height: 56,),
          Text("服务条款和隐私政策",style: TextStyle(fontSize: 19, color: Color(0xFF333333),fontFamily: "PingFangSC",fontWeight: FontWeight.bold),),
          SizedBox(height: 15,),
          Row(
            children: [
              SizedBox(width:31),
              Text("一、【服务概述】",style: TextStyle(fontSize: 15, color: Color(0xFF333333),fontFamily: "PingFangSC",fontWeight: FontWeight.bold),),
            ],
          ),
          ],),
       
      ),
    );
  }
}
