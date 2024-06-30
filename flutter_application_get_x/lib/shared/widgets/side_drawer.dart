import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Drawer(
          
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Drawer Header'),
              ),
              ListTile(
                title: const Text('Liste des Filieres'),
                onTap: () {
                  Get.offAndToNamed("/");
                  
                },
              ),
              ListTile(
                title: const Text('Add Filiere'),
                onTap: () {
                   Get.offAndToNamed("/add");
                },
              ),
            ],
          ),
        );
  }
}