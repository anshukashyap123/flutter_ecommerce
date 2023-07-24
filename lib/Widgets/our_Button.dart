import 'package:flutter_ecommerce/Const/consts.dart';

Widget ourButton({onPress, bgcolor, textColor,String? title}) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(

          backgroundColor: bgcolor,
          padding: const EdgeInsets.all(12),
      ),
      onPressed:onPress,
      child: title!.text.color(textColor).fontFamily(bold).make(),
  );
}
