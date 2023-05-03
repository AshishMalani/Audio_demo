import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CommonText {
  static text({required String text, color, fontWeight, fontSize}) {
    return Text(
      text,
      style: TextStyle(color: color, fontWeight: fontWeight, fontSize: fontSize, fontFamily: "Roboto"),
    );
  }
}

HW hw = HW();

class HW {
  var height = Get.height;
  var width = Get.width;
  var paddingwidth = Get.width * 0.065104166666667;
}
