import 'package:craftsman/app/modules/home/controllers/service_protocal_controller.dart';
import 'package:craftsman/app/modules/home/views/widgets/load_image.dart';
import 'package:craftsman/app/modules/home/views/widgets/top_background.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceProtocolPage extends GetView<ServiceProtocolController> {
  @override
  Widget build(BuildContext context) {
    var normalStyle = TextStyle(height: 1.8,
        fontFamily: "PingFangSC", fontWeight: FontWeight.normal, fontSize: 15,);
    var boldStyle = TextStyle(
        fontFamily: "PingFangSC", fontWeight: FontWeight.bold, fontSize: 15);
    return Scaffold(
        // appBar: AppBar(title: Text('ServiceProtocolPage')),

        body: SingleChildScrollView(
          child: Column(
              children: [
          TopBackground(
            title: "服务条款",
          ),
          Padding(
            padding: EdgeInsets.only(top: 4, left: 31, right: 31, bottom: 17),
            child: Column(children: [
              Text.rich(TextSpan(
                  style: normalStyle,
                  text:
                      "   本服务条款和隐私政策是用户（您）与中国联合网络通信有限公司（下称“本公司”、“中国联通”）之间关于用户登录、使用“手机号一键登录”服务所订立的协议，使用包括中国联通所运营的“手机号一键登录”服务。本公司在此特别提醒用户认真阅读、充分理解本《服务条款和隐私政策》（下称“协议”），并",
                  children: [
                    TextSpan(
                        text:
                            "慎重选择接受或不接受本《协议》（如果您未满14周岁，请在法定监护人的陪同下阅读，并注意未成年人保护条款）。除非您接受本《协议》所有条款，否则您无权使用“手机号一键登录”服务。您的登录、使用等行为将视为对本《协议》的接受、认可，并同意接受本《协议》各项条款的约束。",
                        style: boldStyle),
                    TextSpan(
                      style: normalStyle,
                        text:
                            "\n\t\t\t\t本《协议》描述本公司与用户之间关于“手机号一键登录”服务相关方面的权利义务。“用户”是指登录、使用本服务的个人或组织。",),
                    TextSpan(
                      style: boldStyle,
                      text: "您对本协议的接受即受全部条款的约束，包括接受中国联通对本服务条款随时所做的任何修改。您同意本公司有权以网页公告（网址：https://opencloud.wostore.cn/authz/resource/html/disclaimer.html?fromsdk=true）等合理方式通知您修改本《协议》条款，您在享受本服务时，应及时查阅了解修改的内容；若您在本《协议》内容公告变更后继续使用本服务的，表示您已充分阅读、理解并接受修改后的协议内"),
                  ])),
              SafeArea(
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
                      style: TextStyle(fontSize: 11, color: Color(0xFF333333)),
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
                    onPressed: () {Get.to(() => ServiceProtocolPage());},
                    child: Text(
                      "隐私政策",
                      style: TextStyle(fontSize: 11, color: Color(0xFF333333)),
                    )),
              ],
            ),
          ),
            ]),
          ),
              ],
            ),
        ));
  }
}
