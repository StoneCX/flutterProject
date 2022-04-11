import 'package:craftsman/app/modules/home/views/widgets/load_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: Column(
          children: [
            ResetBackground(),
            SizedBox(
              height: 30,
            ),
            // TextField(
            //   decoration: InputDecoration(
            //             contentPadding: EdgeInsets.only(left: 0),
            //             fillColor: Colors.transparent,
            //             hintText: "",
            //             constraints: BoxConstraints(maxHeight: 5),
            //             //移除maxlength counter
            //             counterText: "",
            //             hintStyle: TextStyle(
            //                 fontFamily: "PingFangSC",
            //                 fontSize: 14,
            //                 height: 0.3,
            //                 color: Color(0xFF999999),
            //                 letterSpacing: 0.6),
            //             border: OutlineInputBorder(
            //               borderSide: BorderSide(
            //                 width: 0,
            //                 style: BorderStyle.none,
            //               ),
            //             ),
            //             // filled: true,
            //             // contentPadding: EdgeInsets.only(top:16),
            //           ),
            // )
            Container(
              padding: EdgeInsets.symmetric(horizontal: 38.0),
              height: 30,
              width: double.infinity,
              child: TextField(
                onChanged: (value) {
                  print("password field value change....");
                },
                // controller: homeLogic.controller,
                maxLength: 11,
                textAlign: TextAlign.left,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  // suffixIconConstraints: BoxConstraints(maxHeight: 24,maxWidth: 24,minHeight: 20,minWidth: 20),
                  suffix: Container(
                    width: 28,
                    height: 28,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        visualDensity:
                            VisualDensity(horizontal: -2, vertical: -2),
                      ),
                      onPressed: () {
                        print('password reset page clear button....');
                        // homeLogic.controller.clear();
                        // homeLogic.getVerifyCode.value = false;
                        // print('clear button is clicked... ${homeLogic.controller}');
                      },
                      child: LoadImage("close-circle-fill"),
                    ),
                  ),
                  fillColor: Colors.transparent,
                  hintText: "手机号/邮箱/账号名",
                  constraints: BoxConstraints(maxHeight: 5),
                  contentPadding: EdgeInsets.only(left: 0),
                  //移除maxlength counter
                  counterText: "",
                  hintStyle: TextStyle(
                      fontFamily: "PingFangSC",
                      fontSize: 14,
                      height: 0.3,
                      color: Color(0xFF999999),
                      letterSpacing: 0.6),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  // filled: true,
                  // contentPadding: EdgeInsets.only(top:16),
                ),
              ),
            ),
            SizedBox(height: 6),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 38),
              child: Container(
                width: double.infinity,
                height: 1,
                color: Color(0xFFC0C0C0),
              ),
            ),
            SizedBox(
              height: 58,
            ),
            TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 110, vertical: 11),
                backgroundColor: Color(0xFFEFEFEF),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.5)),
              ),
                onPressed: () {},
                child: Text(
                  "获取验证码",
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: "PingfangSC",
                      color: Color(0xFF999999)),
                )),
          ],
        ),
      ),
    );
  }
}

class ResetBackground extends StatelessWidget {
  const ResetBackground({
    Key? key,
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
      child: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
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
                    child: Stack(children: [
                      Text(
                        "",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 17,
                          color: Color(0xff000000),
                        ),
                      ),
                    ]),
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.only(left: 17),
                        alignment: Alignment.centerLeft,
                      ),
                      onPressed: null,
                      child: Text("")),
                ]),
            SizedBox(
              height: 56,
            ),
            Text(
              "找回密码",
              style: TextStyle(
                  fontSize: 19,
                  color: Color(0xFF333333),
                  fontFamily: "PingFangSC",
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
