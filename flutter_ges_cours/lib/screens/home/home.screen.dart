import 'package:flutter/material.dart';
import 'package:flutter_ges_cours/screens/home/widgets/bottom.nav.dart';
import 'package:flutter_ges_cours/screens/home/widgets/cours.widget.dart';
import 'package:flutter_ges_cours/shared/colors.constant.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldbg,
        //Botom Navigation Bar   ==> Footer
       // bottomNavigationBar: BbwBottomNavigationBar(),
        //Body==> Body
        body: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            child:  Stack(
              children: [
               Padding(
                 padding: const EdgeInsets.only(top: 270),
                 child: Container(
                  color: containercolor,
                  height: 1000,
                 ),
               ),
               SafeArea(
                bottom: false,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top:40,
                      left: 20,bottom: 20,
                      right: 20
                    ),
                    child: Column(
                      children: [
                       RichText(
                         text: const TextSpan(
                          text: 'Bienvenue ',
                        style: TextStyle(
                          color: white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'emploi du temps  ',
                            style: TextStyle(
                              color: yellow,
                              letterSpacing: 1,
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                            ),
                          ),
                             TextSpan(
                            text: ' de la semaine 👋',
                            style: TextStyle(
                              color: white,
                               letterSpacing: 1,
                               fontWeight: FontWeight.bold,
                              fontSize: 20
                            ),
                          ),

                        ],
                      ),),
                     const  SizedBox(height: 20,),
                     Container(
                      padding: const EdgeInsets.symmetric(horizontal:12,vertical: 8 ),
                      height: 60,
                      decoration: BoxDecoration(
                        color: textfieldbg,
                        borderRadius: BorderRadius.circular(8)
                      ),
                      child: Center(
                        child: TextFormField(
                          style: const TextStyle(
                            color: containercolor,
                            fontSize: 18,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w400
                           ),
                          // autofocus: false,
                          initialValue: null,
                          decoration: const InputDecoration.collapsed(
                            hintText: "Rechercher un cours",
                            hintStyle: TextStyle(
                              fontSize: 18,
                             letterSpacing: 1,
                             fontWeight: FontWeight.w400,
                             color:containercolor 
                            )
                            ),
                            
                        ),
                      ),
                     
                     ),  
                       const  SizedBox(height: 20,),
                          BbwCoursWidget()
                      ],
                      ),
                  ),))
            ],)
          ),
        ),
      );
  }
}