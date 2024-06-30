
import 'package:flutter/material.dart';
import 'package:flutter_ges_cours/screens/widgets/text_widget.dart';
import 'package:flutter_ges_cours/shared/colors.constant.dart';

class BadgeWidget extends StatelessWidget {
  Function? onClick;
  final Color bgColor;
  final Color textColor;
  final double borderRaduis;
  final String text;
  final double width;
  final double size;
   BadgeWidget({super.key, this.bgColor=blue, required this.textColor,  this.borderRaduis=10, required this.text,  this.width=100,this.size=14,this.onClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:() => {
        if(onClick!=null){
           onClick!()
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
        width: width,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(borderRaduis)
        ),
         child:  textButton(text: text,textColor: textColor,size:size)
       ),
    );
  }
}