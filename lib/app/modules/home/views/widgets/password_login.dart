import 'package:craftsman/app/modules/home/views/reset_password.dart';
import 'package:craftsman/app/modules/home/views/widgets/load_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class PasswordLogin extends StatelessWidget {
  const PasswordLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 15,
          ),
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
          Container(
            padding: EdgeInsets.symmetric(horizontal: 38),
            child: Container(
              width: double.infinity,
              height: 1,
              color: Color(0xFFC0C0C0),
            ),
          ),
          SizedBox(height: 24),
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
                      child: LoadImage("show_passwd"),
                    ),
                  ),
                fillColor: Colors.transparent,
                hintText: "密码",
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
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 38),
            child: Row(
              children: [
                Spacer(),
                // Text("忘记密码？"),
                TextButton(
                    onPressed: () {
                      Get.to(() => ResetPassword());
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.all(0),
                      visualDensity:
                          VisualDensity(horizontal: -1, vertical: -4),
                    ),
                    child: Text(
                      "忘记密码?",
                      style: TextStyle(
                          fontSize: 13,
                          fontFamily: "PingFangSC",
                          color: Color(0xFF999999)),
                    )),
              ],
            ),
          ),
          SizedBox(height: 20),
          TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 133, vertical: 12),
                backgroundColor: Color(0xFFEFEFEF),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22.5)),
              ),
              onPressed: () {},
              child: Text(
                "登录",
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: "PingfangSC",
                    color: Color(0xFF999999)),
              )),
        ],
      ),
    );
  }
}
