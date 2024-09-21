import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internship_pakistan/ui/shared/colors.dart';

class CustomRadio extends StatelessWidget {
  final int value;
  final Color? fillColor;
  final Function(int?)? onTaped;
  final int selected;
  final double? width;
  final double? height;
  final double? scaleX;
  final double? scaleY;

  const CustomRadio({
    super.key,
    required this.value,
    this.fillColor,
    required this.onTaped,
    required this.selected,
    this.width,
    this.height,
    this.scaleX,
    this.scaleY,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
        scaleX: scaleX ?? 15.w,
        scaleY: scaleY ?? 15.w,
        //alignment: Alignment.centerLeft,
        child: SizedBox(
          width: width ?? 20.w,
          height: height ?? 20.w,
          child: Radio(
            value: value,
            groupValue: selected,
            onChanged: onTaped,
            fillColor: MaterialStateColor.resolveWith(
                (states) => fillColor ?? AppColors.mainColor),
          ),
        ));
  }
}
