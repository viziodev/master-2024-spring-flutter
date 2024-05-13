

import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget BbwBottomNavigationBar(){
    return BottomNavigationBar(
          items: const [
             BottomNavigationBarItem(
             icon: Icon(Icons.home),
             label: 'Home',
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
           ),
           BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
           ),
       ],);
}