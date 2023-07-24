import 'package:flutter/cupertino.dart';
import 'package:flutter_ecommerce/Const/consts.dart';

Widget bgwidget({Widget? child}) {
  return Container(
    decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(imgBackground), fit: BoxFit.fill)),
    child: child,
  );
}
