
import 'package:flutter/material.dart';
import 'package:flutter_ges_cours/core/models/seance_model.dart';
import 'package:flutter_ges_cours/screens/widgets/badge_widget.dart';
import 'package:flutter_ges_cours/screens/widgets/button_widget.dart';
import 'package:flutter_ges_cours/screens/widgets/text_widget.dart';
import 'package:flutter_ges_cours/shared/colors.constant.dart';

class SeanceList extends StatelessWidget {
  final Future<List<SeanceModel>> datas;
  const SeanceList({super.key,required this.datas});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FutureBuilder(
          future: datas,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasData) {
              return Column(
                children: [
                  for (int i = 0; i < snapshot.data!.length; i++)
                     SeanceItem(
                      seance: snapshot.data![i],
                     )
                ],
              );
            } else {
              return const Center(
                child: Text("Erreur de Chargement"),
              );
            }
          },
        ),
    );
  }
}

class SeanceItem extends StatefulWidget {
  final SeanceModel seance;
    const SeanceItem({super.key, 
    required this.seance
   });

  @override
  State<SeanceItem> createState() => _SeanceItemState();
}

class _SeanceItemState extends State<SeanceItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
       height: 150, 
       width: double.infinity,
       decoration:  BoxDecoration(color: Colors.white,
       borderRadius:BorderRadius.circular(16)),
      child: Row(children: [
        ClipRRect(
            borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16)
            ),
            child: Container(
             height: double.infinity,
              width: 110,
             child: Image.network( 'https://thumbs.dreamstime.com/b/flat-illustration-woman-data-analyst-business-digital-marketing-perfect-landing-page-website-content-media-social-vector-189608980.jpg',
              fit: BoxFit.cover,
             ),
          ),
        ), 
         Column(
           mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: [
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                   BadgeWidget(textColor: Colors.white, text: widget.seance.cours.professor,width:110),
                   BadgeWidget(textColor: Colors.white, text: "Duree:${ widget.seance.duree}H",width:100)
              ],),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    textButton(text:widget.seance.date, textColor: Colors.black,size:14) ,
                    const SizedBox(width: 15,),
                    textButton(text: "${widget.seance.startTime}H-${widget.seance.endTime}H", textColor: Colors.black,size:14)

              ],),
              const Padding(
                padding:  EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                      ButtonWidget(textColor: Colors.white, text: "Absence",size:12,bgColor:yellow,),
                      SizedBox(width: 10,),
                      ButtonWidget(textColor: Colors.white, text: "Emarger")
                       
                ],),
              )
        ],)
      ]),
    );
  }
}
