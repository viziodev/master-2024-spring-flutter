import 'package:flutter/material.dart';
import 'package:flutter_application_get_x/bindings/store_binding.dart';
import 'package:flutter_application_get_x/models/provider/provider.dart';
import 'package:flutter_application_get_x/views/add_filiere.dart';
import 'package:flutter_application_get_x/views/home/home_view.dart';
import 'package:get/instance_manager.dart';

import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  await Get.putAsync(() => StorageData().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "/",
      initialBinding: StoreBinding(),
      getPages: [
         GetPage(
          name: "/",
          page: () =>  HomeView(),
        ),
        GetPage(
          name: "/add",
          page: () =>  AddFiliere(),
        )
      ],
      home:  HomeView(),
    );
  }
}
