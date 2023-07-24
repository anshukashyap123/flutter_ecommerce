import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/Const/consts.dart';
import 'package:flutter_ecommerce/Views/Signup.dart';
import 'package:flutter_ecommerce/Widgets/applogo.dart';
import 'package:flutter_ecommerce/Widgets/bg_widget.dart';
import 'package:flutter_ecommerce/Widgets/customeTextField.dart';
import 'package:flutter_ecommerce/Widgets/our_Button.dart';
import 'package:flutter_ecommerce/Const/Lists.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'HomeDashboard.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return bgwidget(
        child: Scaffold(
      resizeToAvoidBottomInset: false, //for avoid falling
      body: Center(
          child: Column(
        children: [
          (context.screenHeight * 0.1).heightBox,
          applogoWidget(),
          10.heightBox,
          Column(
            children: [
              customeTextField(emailhint, emailhint, null),
              customeTextField(pass, passwordhint, null),
              Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {},
                      child: forgetpass.text.color(Colors.red).bold.make())),
              5.heightBox,
              //ourButton(null,redColor,whiteColor,login).box.width(context.screenWidth -50).make(),
              // ourButton(onPress: (){}, color: redColor , textColor: whiteColor, title: login).box.width(context.screenWidth-50).make(),
              // ourButton((){},redColor,whiteColor,login).box.width(context.screenWidth -50).make(),
              ourButton(
                      onPress: () {

                        Get.to(HomeDashboard());
                      },
                      bgcolor: redColor,
                      textColor: whiteColor,
                      title: login)
                  .box
                  .width(context.screenWidth - 50)
                  .make(),
              5.heightBox,
              creatnewaccount.text.color(fontGrey).bold.make(),
              5.heightBox,
              ourButton(
                      onPress: () {
                        Get.to(() => Signup());
                      },
                      bgcolor: lightGolden,
                      textColor: redColor,
                      title: signup)
                  .box
                  .width(context.screenWidth - 50)
                  .make(),
              10.heightBox,
              loginWith.text.color(gray).make(),
              5.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    3,
                    (index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            backgroundColor: Colors.lightGreen,
                            radius: 25,
                            child: Image.asset(
                              socialList[index],
                              width: 30,
                            ),
                          ),
                        )),
              ),
            ],
          )
              .box
              .white
              .rounded
              .padding(EdgeInsets.all(16))
              .width(context.screenWidth - 70)
              .shadowSm
              .make(),
        ],
      )),
    ));
  }
}
