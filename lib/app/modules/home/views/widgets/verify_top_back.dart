import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import 'load_image.dart';

class VerifyTopBack extends StatelessWidget {
  const VerifyTopBack({ Key? key }) : super(key: key);

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
          // mainAxisAlignment: MainAxisAlignment.end,
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
                  "", 
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
          Expanded(child: Text("")),
          Text("登录精匠",style: TextStyle(fontFamily: "PingFangSC", fontSize: 20, color: Color(0xFF333333)),),
          SizedBox(height: 33,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(onPressed: (){}, child: Text('')),
              Text("13112341234"),
              TextButton(
                style: TextButton.styleFrom(
                padding: EdgeInsets.only(left: 3,right: 0),
                alignment: Alignment.centerLeft,
                ),
                onPressed: (){}, child: LoadImage("edit")),
            ],
          ),
          ],),
       
      ),
    );
  }
}