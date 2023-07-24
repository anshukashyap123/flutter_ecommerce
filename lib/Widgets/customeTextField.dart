import 'package:flutter_ecommerce/Const/consts.dart';
import 'package:flutter_ecommerce/Const/strings.dart';

Widget customeTextField(String? Title,String? hint,controller){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Title!.text.color(Colors.red).fontFamily(semibold).size(16).make(),
      5.heightBox,
      TextFormField(
        controller: controller,
        decoration: InputDecoration(hintStyle: TextStyle(fontFamily: semibold,color: fontGrey),
          hintText: hint,
          isDense: true,//for small
          fillColor: lightGrey,
          filled: true,
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red))
        ),
      )

    ],
  );
}