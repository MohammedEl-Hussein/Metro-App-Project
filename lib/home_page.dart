import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:metrohelper/travel_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  var nameController = TextEditingController();
  var enabled = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/homeBackground.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Name',
                    labelStyle: TextStyle(
                      color: Color(0xFF67C090),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Times new roman',
                    ),

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.white, width: 1.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2),
                    ),
                  ),
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'times new roman',
                    fontSize: 16,
                  ),
                  controller: nameController,
                  onChanged: (value) {
                    if (value.trim().isEmpty)
                      enabled.value = false;
                    else
                      enabled.value = true;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  bottom: 32.0,
                  right: 8.0,
                  top: 16.0,
                ),
                child: SizedBox(
                  width: 300,
                  child: Obx(() {
                    return OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: StadiumBorder(),
                        disabledBackgroundColor: Colors.grey,
                      ),

                      onPressed: enabled.value
                          ? () {
                              Get.to(
                                TravelPage(),
                                arguments: {'name': nameController.text},
                              );
                            }
                          : null,
                      child: Text(
                        'Start your journey',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Times New Roman',
                          color: Colors.white,
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
