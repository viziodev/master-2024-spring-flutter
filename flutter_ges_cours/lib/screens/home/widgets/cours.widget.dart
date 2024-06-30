import 'package:flutter/material.dart';
import 'package:flutter_ges_cours/core/models/home.model.dart';
import 'package:flutter_ges_cours/screens/detail/detail.screen.dart';
import 'package:flutter_ges_cours/screens/widgets/badge_widget.dart';
import 'package:flutter_ges_cours/shared/colors.constant.dart';

class BbwCoursWidget extends StatelessWidget {
   final Future<List<CoursModel>> datas;
  const BbwCoursWidget({super.key,required this.datas});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: FutureBuilder(
          future: datas,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasData) {
              return Row(
                children: [
                  for (int i = 0; i < snapshot.data!.length; i++)
                    BbwCoursWidgetItem(
                      cours: snapshot.data![i],
                    )
                ],
              );
            } else {
              return const Center(
                child: Text("Erreur de Chargement"),
              );
            }
          },
        ));
  }
}

class BbwCoursWidgetItem extends StatefulWidget {
  CoursModel cours;
  BbwCoursWidgetItem({super.key, required this.cours});

  @override
  State<BbwCoursWidgetItem> createState() => _BbwCoursWidgetItemState();
}

class _BbwCoursWidgetItemState extends State<BbwCoursWidgetItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6),
      height: 130,
      width: 108,
      decoration:
          BoxDecoration(color: white, borderRadius: BorderRadius.circular(16)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 6),
            child: CircleAvatar(
              radius: 35,
              backgroundColor: containercolor,
              backgroundImage: NetworkImage(
                  "https://innovation-en-education.fr/wp-content/uploads/2022/08/Comment-rendre-un-cours-plus-inte%CC%81ressant1.jpg"),
            ),
          ),
          BadgeWidget(
              textColor: Colors.white,
              text: widget.cours.module,
              width: 80,
              bgColor: scaffoldbg,
              onClick: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  DetailCours(cours: widget.cours,)),
                );
              }),
        ],
      ),
    );
  }
}
