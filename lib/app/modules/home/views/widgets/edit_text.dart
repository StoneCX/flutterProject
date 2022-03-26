import 'package:craftsman/app/modules/home/controllers/home_controller.dart';
import 'package:craftsman/app/modules/home/views/widgets/load_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';

import 'package:get/route_manager.dart';

// ignore: must_be_immutable
class EditText extends StatelessWidget {
  String title;
  // TextEditingController? controller;
  EditText({
    required this.title,
  });

  var homeLogic = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.grey.shade100),
                    overlayColor:
                        MaterialStateProperty.all<Color>(Colors.grey.shade300),
                  ),
                  onPressed: () {
                    print("selectCountry");
                  },
                  child: Row(
                    children: [
                      Text(
                        "+86",
                        style: TextStyle(
                            fontFamily: "PingFangSC",
                            fontSize: 14,
                            color: Color(0xFF333333),
                            letterSpacing: 0.8),
                      ),
                      SizedBox(
                        width: 14,
                      ),
                      LoadImage("right_next"),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 14,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: 200,
                  height: 30,
                  child: TextField(
                    onChanged: (value) {
                      if (value.length == 11) {
                        print("eleven11...........then what to do ? ");
                        homeLogic.getVerifyCode.value = true;
                      } else if (value.length < 11) {
                        print("less then what to do ? ");
                        homeLogic.getVerifyCode.value = false;
                      }
                    },
                    controller: homeLogic.controller,
                    maxLength: 11,
                    textAlign: TextAlign.left,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      fillColor: Colors.transparent,
                      hintText: title,

                      constraints: BoxConstraints(maxHeight: 5),
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
                  width: 28,
                  height: 28,
                  child: TextButton(
                    onPressed: () {
                      homeLogic.controller.clear();
                      homeLogic.getVerifyCode.value = false;
                      // print('clear button is clicked... ${homeLogic.controller}');
                    },
                    child: LoadImage("close-circle-fill"),
                  ),
                ),
              ],
            ),
          ],
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            width: 54,
            height: 1,
            color: Color(0xFFC0C0C0),
          ),
          SizedBox(
            width: 14,
          ),
          Container(
            width: 227,
            height: 1,
            color: Color(0xFFC0C0C0),
          )
        ])
      ],
    );
  }
}
