import 'package:flutter/material.dart';
import 'package:flutter_ges_cours/core/models/home.model.dart';
import 'package:flutter_ges_cours/core/services/cours.service.dart';
import 'package:flutter_ges_cours/shared/colors.constant.dart';

class BbwCoursWidget extends StatelessWidget {
   BbwCoursWidget({super.key});
  Future<List<CoursModel>> coursFuture= CoursService.findAll();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: FutureBuilder(
                              future: coursFuture, 
                              builder:(context, snapshot) {
                                if (snapshot.connectionState==ConnectionState.waiting) {
                                    return const CircularProgressIndicator();
                                }else if(snapshot.hasData){
                                  return  Row(children: [
                                       for(int i=0;i<snapshot.data!.length;i++)
                                          BbwCoursWidgetItem(cours:snapshot.data![i],)
                                    ],);
                                }else{
                                    return const Center(child: Text("Erreur de Chargement"),);
                                }
                              },
                              )
                       );
  }
}


class BbwCoursWidgetItem extends StatefulWidget {
  CoursModel cours;
   BbwCoursWidgetItem({super.key,required this.cours});

  @override
  State<BbwCoursWidgetItem> createState() => _BbwCoursWidgetItemState();
}

class _BbwCoursWidgetItemState extends State<BbwCoursWidgetItem> {
  @override
  Widget build(BuildContext context) {
                       return Container(
                                        margin: const EdgeInsets.all(6),
                                          height: 120,
                                          width: 108,
                                         
                                          decoration: BoxDecoration(
                                             color: white,
                                             borderRadius: BorderRadius.circular(16)
                                          ),

                                          child:  Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              const Padding(
                                                padding: EdgeInsets.only(top:6),
                                                child: CircleAvatar(
                                                  radius: 35,
                                                  backgroundColor: containercolor,
                                                  backgroundImage: NetworkImage("https://innovation-en-education.fr/wp-content/uploads/2022/08/Comment-rendre-un-cours-plus-inte%CC%81ressant1.jpg"),
                                                ),
                                              ),
                                              Text(widget.cours.module,style: const TextStyle(
                                                 fontSize: 16,
                                                 letterSpacing: 1,
                                                 fontWeight: FontWeight.w400,
                                                
                                              ),)

                                            ],
                                            ),
                    );
  }
}