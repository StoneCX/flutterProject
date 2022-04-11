import 'package:craftsman/app/modules/home/controllers/login_controller.dart';
import 'package:craftsman/app/modules/home/views/service_protocal.dart';
import 'package:craftsman/app/modules/home/views/verify_code_view.dart';
import 'package:craftsman/app/modules/home/views/widgets/password_login.dart';
import 'package:craftsman/app/modules/home/views/widgets/top_anouncemant.dart';
import 'package:craftsman/app/modules/home/views/widgets/edit_text.dart';
import 'package:craftsman/app/modules/home/views/widgets/load_image.dart';
import 'package:craftsman/app/modules/home/views/widgets/submit_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class LoginView extends GetView<LoginController> {
  final homeLogic = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          //如果设计需要覆盖safearea 则去除safearea的包裹。
          body: CustomScrollView(slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(children: [
            TopAnouncement(),
            SizedBox(
              height: 31,
            ),
            // EditText(title: "请输入手机号", controller: homeLogic.controller,),
            Obx(() => Visibility(
                  visible: homeLogic.loginGate.value == LoginGateWay.code,
                  child: Column(
                    children: [
                      EditText(
                        title: "请输入手机号",
                      ),
                      SizedBox(
                        height: 58,
                      ),
                      SubmitButton(
                          title: "获取验证码",
                          act: () {
                            Get.to(() => VerifyCodeView());
                          }),
                      SizedBox(
                        height: 18,
                      ),
                    ],
                  ),
                )),
            Obx(() => Visibility(
                  visible: homeLogic.loginGate.value == LoginGateWay.password,
                  child: Column(
                    children: [
                      // EditText(
                      //   title: "请输入手机号",
                      // ),
                      PasswordLogin(),
                      SizedBox(
                        height: 18,
                      ),
                    ],
                  ),
                )),
            TextButton(
                onPressed: () {
                  // print('账号密码登录');
                  if (homeLogic.loginGate.value == LoginGateWay.password) {
                    homeLogic.loginGate.value = LoginGateWay.code;
                  } else {
                    homeLogic.loginGate.value = LoginGateWay.password;
                  }
                },
                child: Obx(() => Text(
                      homeLogic.loginGate.value == LoginGateWay.password
                          ? "账号密码登录"
                          : "短信快捷登录",
                      style: TextStyle(
                          fontFamily: "PingFangSC",
                          fontSize: 14,
                          color: Color(0xFF333333),
                          letterSpacing: 0),
                    ))),
            Expanded(child: Text("")),
            // Flexible(child: Text(""),fit: FlexFit.loose,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 43),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: LoadImage(
                      "wechat_icon.png",
                      width: 40,
                      height: 40,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: LoadImage(
                      "qq_icon.png",
                      width: 40,
                      height: 40,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: LoadImage(
                      "weibo_icon.png",
                      width: 40,
                      height: 40,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: LoadImage(
                      "alipay_icon.png",
                      width: 40,
                      height: 40,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 45,
            ),
            SafeArea(
              top: false,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all<Color>(
                            Colors.grey.shade400),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                      ),
                      onPressed: () {},
                      child: LoadImage("select_circle")),
                  Text(
                    "登录即代表您已同意",
                    style: TextStyle(
                        fontSize: 11,
                        fontFamily: "PingFangSC",
                        color: Color(0xFFCCCCCC),
                        letterSpacing: 0),
                  ),
                  TextButton(
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all<Color>(
                            Colors.grey.shade400),
                      ),
                      onPressed: () {
                        Get.to(() => ServiceProtocolPage());
                      },
                      child: Text(
                        "精匠用户注册协议",
                        style:
                            TextStyle(fontSize: 11, color: Color(0xFF333333)),
                      )),
                  Text(
                    "与",
                    style: TextStyle(
                        fontSize: 11,
                        fontFamily: "PingFangSC",
                        color: Color(0xFFCCCCCC),
                        letterSpacing: 0),
                  ),
                  TextButton(
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all<Color>(
                            Colors.grey.shade400),
                      ),
                      onPressed: () {
                        Get.to(() => ServiceProtocolPage());
                      },
                      child: Text(
                        "隐私政策",
                        style:
                            TextStyle(fontSize: 11, color: Color(0xFF333333)),
                      )),
                ],
              ),
            ),
          ]),
        ),
      ])),
    );
  }
}
