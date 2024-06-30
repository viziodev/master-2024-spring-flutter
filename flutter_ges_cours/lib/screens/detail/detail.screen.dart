import 'package:flutter/material.dart';
import 'package:flutter_ges_cours/core/models/home.model.dart';
import 'package:flutter_ges_cours/core/models/seance_model.dart';
import 'package:flutter_ges_cours/core/services/seance_service.dart';
import 'package:flutter_ges_cours/screens/widgets/badge_widget.dart';
import 'package:flutter_ges_cours/screens/widgets/seance_list_widget.dart';
import 'package:flutter_ges_cours/screens/widgets/text_widget.dart';
import 'package:flutter_ges_cours/shared/colors.constant.dart';

class DetailCours extends StatelessWidget {
  final CoursModel cours;
  const DetailCours({super.key,required this.cours});

  @override
  Widget build(BuildContext context) {
    Future<List<SeanceModel>> seancesFuture = SeanceService.findAll(uri: "cours/${cours.id}");
    return Scaffold(
      backgroundColor: containercolor,
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: scaffoldbg,
        title: textButton(
            text: "Cours ", textColor: yellow, size: 25, bold: FontWeight.bold),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.all(5),
                  height: 320,
                  width: double.maxFinite - 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16)),
                  child: Column(
                    children: [
                       Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Container(
                          height: 120,
                          width: 120,
                          child:  CircleAvatar(
                            radius: 35,
                            backgroundColor: containercolor,
                            backgroundImage: NetworkImage(
                                cours.icon),
                          ),
                        ),
                      ),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          BadgeWidget(
                              textColor: Colors.white,
                              text: cours.professor,
                              size: 20,
                              width: 300,
                              bgColor:scaffoldbg),
                          
                        ],
                      ),
                      const SizedBox(height: 8,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          BadgeWidget(
                              textColor: Colors.white,
                              text: cours.module,
                              size: 18,
                              width: 140),
                          BadgeWidget(
                            textColor: Colors.white,
                            text: "HG:${cours.totalHeure}H",
                            width: 80,
                            bgColor: yellow,
                          )
                        ],
                      ),
                      const SizedBox(height: 8,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          BadgeWidget(
                              textColor: Colors.white,
                              text: "HP:${cours.totalHeurePlanifier}H",
                               bgColor: Colors.redAccent,),
                          BadgeWidget(
                            textColor: Colors.white,
                            text: "HR:${cours.totalHeureRealiser}H",
                            bgColor: Colors.green,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                textButton(
                    text: "Les Seances du Cours",
                    textColor: Colors.black,
                    size: 20,
                    bold: FontWeight.bold),
                const SizedBox(
                  height: 8,
                ),
                 SeanceList(datas: seancesFuture,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
