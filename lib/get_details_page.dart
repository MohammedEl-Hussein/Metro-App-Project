import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetDetailsPage extends StatelessWidget {
  const GetDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the list of stations passed from TravelPage
    final List<String> route = List<String>.from(Get.arguments['stations']);

    // Calculate number of stations
    final int numberOfStations = route.length;

    // Calculate ticket price (example rules — adjust as needed)
    double ticketPrice;
    if (numberOfStations <= 9) {
      ticketPrice = 8.0;
    } else if (numberOfStations <= 16) {
      ticketPrice = 10.0;
    } else if (numberOfStations <= 23) {
      ticketPrice = 15.0;
    } else {
      ticketPrice = 20.0;
    }

    final int avgTimeMinutes = numberOfStations * 2;

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              margin: EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              color: Colors.black.withOpacity(0.1),
              child: Flex(
                spacing: 16,
                direction: Axis.vertical,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    spacing: 32,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                        child: Text(
                          'Stations',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                        child: Text(
                          'Ticket Price',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        'ET',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  Row(
                    spacing: 48,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        '$numberOfStations',
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Text(
                        ' $ticketPrice EGP',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        '~$avgTimeMinutes minutes',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Route',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: route.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.grey,
                      child: Icon(Icons.train, color: Colors.black),
                    ),
                    title: Card(
                      margin: EdgeInsets.all(8),
                      color: Colors.white.withOpacity(0.1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(8),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          route[index],
                          style: TextStyle(
                            fontFamily: 'Times new roman',
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
