import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_http/controller/homeController.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController _homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Getx_HTTP'),
      ),
      body: Obx(() {
        if (_homeController.isLoading.value)
          return Center(child: CircularProgressIndicator());
        else
          return ListView.builder(
            itemCount: _homeController.userData.length,
            itemBuilder: (_, index) => ListTile(
              title: Text(_homeController.userData[index].name),
              subtitle: Text(_homeController.userData[index].year.toString()),
            ),
          );
      }),
    );
  }
}
