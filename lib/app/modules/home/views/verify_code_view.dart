import 'package:craftsman/app/modules/home/views/widgets/code_input.dart';
import 'package:craftsman/app/modules/home/views/widgets/top_background.dart';
import 'package:craftsman/app/modules/home/views/widgets/verify_top_back.dart';
import 'package:flutter/material.dart';

class VerifyCodeView extends StatelessWidget {
  const VerifyCodeView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          VerifyTopBack(),
          SizedBox(height: 53),
          Container(
                  padding: EdgeInsets.only(bottom:23.0),
                  child: CodeInput(
                    length: 6,
                    keyboardType: TextInputType.number,
                    builder: WigetBuilders.lightRectangle(),
                    onFilled: (value) async {
                      print('Your input is $value.');
                      // pr.show();
                      Future.delayed(const Duration(milliseconds: 1500), () {
                        // setState(() {
                        //   pr.hide();
                        //   Navigator.pushReplacement(
                        //     context,
                        //     MaterialPageRoute(builder: (context) => Home()),
                        //   );
                        // });
                      });
                    },
                  ),
                ),
          Text("验证码已发送，57s后重新获取"),
        ]),
    );
  }
}