import 'package:flutter/material.dart';
import 'package:flutter_application_get_x/controllers/filiere_controller.dart';
import 'package:flutter_application_get_x/models/services/filiere_service.dart';
import 'package:flutter_application_get_x/shared/widgets/side_drawer.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

//GetView<FiliereController>
class HomeView extends StatelessWidget {
  HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: SideDrawer(),
        appBar: AppBar(
          title: const Text("GetX Concepts"),
          titleSpacing: 00.0,
          centerTitle: true,
          toolbarHeight: 60.2,
          toolbarOpacity: 0.8,
          elevation: 0.00,
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                child: Text(
                  "Liste des Filieres ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              /* Obx(() => ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.filieres.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(controller.filieres[index].libelle,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                   );
                },
              ))*/

              GetX<FiliereController>(
                builder: (controller) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.filieres.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(controller.filieres[index].libelle,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      );
                    }
                  );
                },
              )
            ],
          ),
        )));
  }
}
