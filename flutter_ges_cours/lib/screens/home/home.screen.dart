import 'package:flutter/material.dart';
import 'package:flutter_ges_cours/core/models/home.model.dart';
import 'package:flutter_ges_cours/core/models/seance_model.dart';
import 'package:flutter_ges_cours/core/services/cours.service.dart';
import 'package:flutter_ges_cours/core/services/seance_service.dart';
import 'package:flutter_ges_cours/screens/home/widgets/cours.widget.dart';
import 'package:flutter_ges_cours/screens/widgets/seance_list_widget.dart';
import 'package:flutter_ges_cours/screens/widgets/text_widget.dart';
import 'package:flutter_ges_cours/shared/colors.constant.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
      Future<List<CoursModel>> coursFuture = CoursService.findAll();
      Future<List<SeanceModel>> seancesFuture = SeanceService.findAll();
     return Scaffold(
      backgroundColor: scaffoldbg,
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
                       left: 10,
                      bottom: 20,
                      right: 10
                    ),
                    child: Column(
                      children: [
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
                       RichText(
                         text: const TextSpan(
                          text: 'Modules du Semestre',
                          style: TextStyle(
                          color: yellow,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      
                      ),),
                       const  SizedBox(height: 20,),
                          BbwCoursWidget(datas: coursFuture,), 
                          const  SizedBox(height: 20,),
                          textButton(text: "Les Cours de la journee", textColor: Colors.black,size: 20,bold:FontWeight.bold),
                           const  SizedBox(height: 8,),
                           SeanceList(datas: seancesFuture,)
                      ],
                      ),
                  ),))
            ],)
          ),
        ),
      );
  }
}