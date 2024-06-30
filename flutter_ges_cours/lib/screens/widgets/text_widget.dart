

import 'package:flutter/cupertino.dart';

Widget textButton({required String text,required Color textColor, double size=18,FontWeight bold=FontWeight.w500}){
  return Text(text,
      textAlign: TextAlign.center,
       style: TextStyle(color:textColor, 
          fontWeight: bold,
          fontSize: size
       ),);

}