import 'package:flutter/material.dart';
import 'package:flutter_ges_cours/screens/widgets/text_widget.dart';
import 'package:flutter_ges_cours/shared/colors.constant.dart';

class ButtonWidget extends StatelessWidget {
    final Color bgColor;
    final Color  textColor;
    final String text;
    final double size;
      final double borderRaduis;
    const ButtonWidget({super.key,this.bgColor=scaffoldbg, required this.textColor, required this.text,this.size=14,this.borderRaduis=8});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
  onPressed: () {},
   style: ElevatedButton.styleFrom(
     backgroundColor: bgColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRaduis),
    ),
  ),
   child: textButton(text: text,textColor: textColor,size:size)
  );
  }
}