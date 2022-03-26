import 'package:craftsman/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class SubmitButton extends StatefulWidget {
  final String title;
  final void Function()? act;
  SubmitButton({
    required this.title,
    required this.act,
  });

  @override
  _SubmitButtonState createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  var homeLogic = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 38.0, right: 38.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          child: Row(
            children: <Widget>[
              Expanded(
                //GetX状态管理-->响应式状态管理-->监听状态的改变。
                child: Obx(
                  () => ElevatedButton(
                    // color: Color(0xFF3F6BF8),
                    // textColor: Colors.white,
                    // disabledColor: Colors.grey.shade300,
                    // disabledTextColor: Colors.grey.shade900,
                    // shape: RoundedRectangleBorder(
                    //   borderRadius: BorderRadius.circular(30.0),
                    // ),

                    // style: TextButton.styleFrom(
                    //   textStyle: TextStyle(fontSize: 14, color: Colors.white),
                    //   backgroundColor: Color(0xFF3F6BF8),
                    //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                    //   onSurface: Colors.grey.shade400,
                    //   ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.resolveWith<OutlinedBorder>((states) => RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          print(states);
                          if (states.contains(MaterialState.pressed)) {
                            return Color(0xFF3F6BF8);
                          } else if (states.contains(MaterialState.disabled)) {
                            return Colors.grey.shade400;
                          }
                          return Color(
                              0xFF3F6BF8); // Use the component's default.
                        },
                      ),
                    ),
                    onPressed: homeLogic.getVerifyCode.value == true
                        ? widget.act
                        : null, //widget.act,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5.0,
                        horizontal: 8.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Obx(() => Text(
                                  widget.title,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: homeLogic.getVerifyCode.value == true ? Colors.white : Colors.grey.shade600,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
