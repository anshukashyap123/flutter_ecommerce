import 'package:flutter_ecommerce/Const/consts.dart';

Widget homeButton({width,height,icon,String ?title,onpress}){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(icon, width: 30),
      5.heightBox,
      title!.text.color(redColor).make()


    ],
  ).box.rounded.white.size(width, height).make();
}