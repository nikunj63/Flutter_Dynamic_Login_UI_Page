import 'package:flutter/material.dart';

class TextUtils extends StatelessWidget {
  String text;
  Color? color;
  double? size;
  bool? weight;
   TextUtils({super.key,required this.text,this.size,this.color,this.weight});

  @override
  Widget build(BuildContext context) {
    return Text(text,

    style: TextStyle(color:Colors.white,fontSize:size?? 16,
    fontWeight: weight==null?FontWeight.w600:FontWeight.w700
    ),);
  }
}