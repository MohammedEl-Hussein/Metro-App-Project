import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:metrohelper/get_details_page.dart';
import 'package:metrohelper/station.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class TravelPage extends StatelessWidget {
  TravelPage({super.key});

  final placeController = TextEditingController();
  final startController = TextEditingController();
  final lastController = TextEditingController();
  final station = ''.obs;
  final textEnabled = false.obs;
  final buttonEnabled = false.obs;
  final List<Station> line1 = [
    Station(name: 'Helwan', lat: 29.851503421372314, long: 31.33404705911494),
    Station(
      name: 'Ain Helwan',
      lat: 29.864306715635497,
      long: 31.32477734450499,
    ),
    Station(
      name: 'Helwan University',
      lat: 29.869402120358526,
      long: 31.3200495158289,
    ),
    Station(
      name: 'Helwan University',
      lat: 29.869402120358526,
      long: 31.3200495158289,
    ),
    Station(name: 'Wadi Hof', lat: 29.87922629793367, long: 31.31364025166208),
    Station(
      name: 'Hadayek Helwan',
      lat: 29.897276614485317,
      long: 31.303909867972063,
    ),
    Station(
      name: 'El Maasara',
      lat: 29.906149418559252,
      long: 31.29936084157055,
    ),
    Station(
      name: 'Tora El-Asmant',
      lat: 29.925941805340287,
      long: 31.28753364076969,
    ),
    Station(name: 'Kozzika', lat: 29.93629747020329, long: 31.281817713462075),
    Station(
      name: 'Tora El Balad',
      lat: 29.946762686575617,
      long: 31.27299732067851,
    ),
    Station(
      name: 'Sakanat El Maadi',
      lat: 29.9528622177386,
      long: 31.263432097236976,
    ),
    Station(name: 'Maadi', lat: 29.960227717675522, long: 31.257628478536937),
    Station(
      name: 'Hadayek El Maadi',
      lat: 29.970190294129686,
      long: 31.25061039889414,
    ),
    Station(
      name: 'Dar El Salam',
      lat: 29.982060284257948,
      long: 31.24217365689578,
    ),
    Station(
      name: 'El Zahraa',
      lat: 29.995501046742234,
      long: 31.231230131342013,
    ),
    Station(
      name: 'Mar Girgis',
      lat: 30.006123726037156,
      long: 31.229647793219172,
    ),
    Station(
      name: 'El Malek El Saleh',
      lat: 30.017700937858354,
      long: 31.231249162059516,
    ),
    Station(
      name: 'Al Sayeda Zeinab',
      lat: 30.029289621450186,
      long: 31.23537106758672,
    ),
    Station(
      name: 'Saad Zaghloul',
      lat: 30.037012312504007,
      long: 31.238358856491413,
    ),
    Station(name: 'Sadat', lat: 30.044194805436348, long: 31.234360808075333),
    Station(name: 'Nasser', lat: 30.05359019591518, long: 31.238744074342822),
    Station(name: 'Orabi', lat: 30.056676622128048, long: 31.24209267917171),
    Station(
      name: 'Al Shohadaa',
      lat: 30.061112499905622,
      long: 31.246118673542604,
    ),
    Station(name: 'Ghamra', lat: 30.069065608529755, long: 31.26463824769121),
    Station(
      name: 'El Demerdash',
      lat: 30.077338817907265,
      long: 31.277725924700047,
    ),
    Station(
      name: 'Manshiet El Sadr',
      lat: 30.081939661719563,
      long: 31.2874522157908,
    ),
    Station(
      name: 'Kobri El Qobba',
      lat: 30.08719276747253,
      long: 31.29404717812795,
    ),
    Station(
      name: 'Hammamat El Kobba',
      lat: 30.091295525365464,
      long: 31.29890393316106,
    ),
    Station(
      name: 'Saray El Kobba',
      lat: 30.09766496860555,
      long: 31.304540325356953,
    ),
    Station(
      name: 'Hadayeq El Zaitoun',
      lat: 30.105913672215483,
      long: 31.310445117123248,
    ),
    Station(
      name: 'Helmeyet El Zaitoun',
      lat: 30.1132643025616,
      long: 31.313802992366227,
    ),
    Station(
      name: 'El  Matareyya',
      lat: 30.121338287589527,
      long: 31.313845907847075,
    ),
    Station(
      name: 'Ain Shams',
      lat: 30.131007640015785,
      long: 31.31918886815226,
    ),
    Station(
      name: 'Ezbet El Nakhl',
      lat: 30.139210071745616,
      long: 31.324488913148503,
    ),
    Station(name: 'El Marg', lat: 30.1520319644441, long: 31.33571127567496),
    Station(
      name: 'New El Marg',
      lat: 30.163794724127364,
      long: 31.338414942380965,
    ),
  ];

  final List<Station> line2 = [
    Station(
      name: 'Shubra El Kheima',
      lat: 30.122490697482775,
      long: 31.244565715590895,
    ),
    Station(
      name: 'Koliet El Zeraa',
      lat: 30.11380316880935,
      long: 31.248723417577956,
    ),
    Station(name: 'Mezallat', lat: 30.104183155484456, long: 31.24567614965992),
    Station(
      name: 'Khalafawy',
      lat: 30.097893789760786,
      long: 31.245373428448197,
    ),
    Station(
      name: 'St. Teresa',
      lat: 30.087949572201143,
      long: 31.245499692633473,
    ),
    Station(
      name: 'Rod El Farag',
      lat: 30.080577989387745,
      long: 31.24541362296217,
    ),
    Station(name: 'Massara', lat: 30.070885132238278, long: 31.245097122302997),
    Station(
      name: 'Al Shohadaa',
      lat: 30.061089182689045,
      long: 31.246035895467962,
    ),
    Station(name: 'Attaba', lat: 30.052334683387546, long: 31.24680300724532),
    Station(
      name: 'Mohamed Naguib',
      lat: 30.045319343757964,
      long: 31.24416706741418,
    ),
    Station(name: 'Sadat', lat: 30.044167724440108, long: 31.234427966501666),
    Station(name: 'Opera', lat: 30.041965652335122, long: 31.22496875751621),
    Station(name: 'Dokki', lat: 30.038433911700736, long: 31.21222509535387),
    Station(
      name: 'El Bohoos',
      lat: 30.035785460418534,
      long: 31.20015382577616,
    ),
    Station(
      name: 'Cairo University',
      lat: 30.026014663259826,
      long: 31.201170623881445,
    ),
    Station(name: 'Faisal', lat: 30.01737028476348, long: 31.203937732727454),
    Station(name: 'El Giza', lat: 30.010667508840108, long: 31.20708863152624),
    Station(
      name: 'Omm El Misryeen',
      lat: 30.00565224320294,
      long: 31.20810293884582,
    ),
    Station(
      name: 'Sakiat Mekky',
      lat: 29.995490338783494,
      long: 31.208645521892922,
    ),
    Station(name: 'El Monib', lat: 29.981096395088606, long: 31.21231276588331),
  ];

  final List<Station> line3CU = [
    Station(
      name: 'Adly Mansour',
      lat: 30.146441161050493,
      long: 31.421336509447322,
    ),
    Station(
      name: 'Haykestep',
      lat: 30.143846798546445,
      long: 31.404702979706443,
    ),
    Station(
      name: 'Omar Ibn El Khattab',
      lat: 30.14035189221487,
      long: 31.394288347649308,
    ),
    Station(name: 'Qubaa', lat: 30.13480739340722, long: 31.3837183721793),
    Station(
      name: 'Hesham Barakat',
      lat: 30.130840334718137,
      long: 31.372901232364377,
    ),
    Station(
      name: 'El Shams Club',
      lat: 30.125437893460894,
      long: 31.3489047842114,
    ),
    Station(
      name: 'Alf Masken',
      lat: 30.11905221525699,
      long: 31.34015267409673,
    ),
    Station(
      name: 'Heliopolis',
      lat: 30.108443376223985,
      long: 31.33830759846564,
    ),
    Station(name: 'Haroun', lat: 30.10139641461363, long: 31.333025314282217),
    Station(
      name: 'Al Ahram',
      lat: 30.091704123522597,
      long: 31.326361570434038,
    ),
    Station(
      name: 'Koleyet El Banat',
      lat: 30.084008515743538,
      long: 31.329019697650264,
    ),
    Station(name: 'Stadium', lat: 30.072952771228486, long: 31.317146620329837),
    Station(
      name: 'Fair Zone',
      lat: 30.073271365608623,
      long: 31.30092374487761,
    ),
    Station(
      name: 'Abbassiya',
      lat: 30.071986469927033,
      long: 31.28333255596158,
    ),
    Station(
      name: 'Abdou Pasha',
      lat: 30.0647397580017,
      long: 31.274603014202537,
    ),
    Station(
      name: 'El Geish',
      lat: 30.061776838179526,
      long: 31.266838209962668,
    ),
    Station(
      name: 'Bab El Shaariya',
      lat: 30.05408713602435,
      long: 31.25589345168284,
    ),
    Station(name: 'Attaba', lat: 30.052334683387546, long: 31.24680300724532),
    Station(name: 'Nasser', lat: 30.05359019591518, long: 31.238744074342822),
    Station(name: 'Maspero', lat: 30.05580686263744, long: 31.232085672763894),
    Station(
      name: 'Safaa Hijazy',
      lat: 30.06228157632358,
      long: 31.223312236141354,
    ),
    Station(name: 'Kit Kat', lat: 30.066509116768135, long: 31.212961840992747),
    Station(name: 'Tawfikia', lat: 30.06500738801377, long: 31.20232099498435),
    Station(
      name: 'Wadi El Nile',
      lat: 30.057122938329034,
      long: 31.201249255079123,
    ),
    Station(
      name: 'Gamet El Dowal',
      lat: 30.050044066914072,
      long: 31.19892715193698,
    ),
    Station(
      name: 'Boulak El Dakrour',
      lat: 30.037517262378806,
      long: 31.195497376932803,
    ),
    Station(
      name: 'Cairo University',
      lat: 30.026014663259826,
      long: 31.201170623881445,
    ),
  ];

  final line3RElfarag = [
    Station(
      name: 'Adly Mansour',
      lat: 30.146441161050493,
      long: 31.421336509447322,
    ),
    Station(
      name: 'Haykestep',
      lat: 30.143846798546445,
      long: 31.404702979706443,
    ),
    Station(
      name: 'Omar Ibn El Khattab',
      lat: 30.14035189221487,
      long: 31.394288347649308,
    ),
    Station(name: 'Qubaa', lat: 30.13480739340722, long: 31.3837183721793),
    Station(
      name: 'Hesham Barakat',
      lat: 30.130840334718137,
      long: 31.372901232364377,
    ),
    Station(name: 'El Nozha', lat: 30.12796987386345, long: 31.360197297268602),
    Station(
      name: 'El Shams Club',
      lat: 30.125437893460894,
      long: 31.3489047842114,
    ),
    Station(
      name: 'Alf Masken',
      lat: 30.11905221525699,
      long: 31.34015267409673,
    ),
    Station(
      name: 'Alf Masken',
      lat: 30.108443376223985,
      long: 31.33830759846564,
    ),
    Station(
      name: 'Heliopolis',
      lat: 30.108443376223985,
      long: 31.33830759846564,
    ),
    Station(name: 'Haroun', lat: 30.10139641461363, long: 31.333025314282217),
    Station(
      name: 'Al Ahram',
      lat: 30.091704123522597,
      long: 31.326361570434038,
    ),
    Station(
      name: 'Koleyet El Banat',
      lat: 30.084008515743538,
      long: 31.329019697650264,
    ),
    Station(name: 'Stadium', lat: 30.072952771228486, long: 31.317146620329837),
    Station(
      name: 'Fair Zone',
      lat: 30.073271365608623,
      long: 31.30092374487761,
    ),
    Station(
      name: 'Abbassiya',
      lat: 30.071986469927033,
      long: 31.28333255596158,
    ),
    Station(
      name: 'Abdou Pasha',
      lat: 30.0647397580017,
      long: 31.274603014202537,
    ),
    Station(
      name: 'El Geish',
      lat: 30.061776838179526,
      long: 31.266838209962668,
    ),
    Station(
      name: 'Bab El Shaariya',
      lat: 30.05408713602435,
      long: 31.25589345168284,
    ),
    Station(name: 'Attaba', lat: 30.052334683387546, long: 31.24680300724532),
    Station(name: 'Nasser', lat: 30.05359019591518, long: 31.238744074342822),
    Station(name: 'Maspero', lat: 30.05580686263744, long: 31.232085672763894),
    Station(
      name: 'Safaa Hijazy',
      lat: 30.06228157632358,
      long: 31.223312236141354,
    ),
    Station(name: 'Kit Kat', lat: 30.066509116768135, long: 31.212961840992747),
    Station(name: 'Sudan', lat: 30.070101631282782, long: 31.204830170154835),
    Station(name: 'Imbaba', lat: 30.075922336451054, long: 31.207327889413758),
    Station(name: 'El Bohy', lat: 30.08212717769306, long: 31.21046655626206),
    Station(
      name: 'El Qawmia',
      lat: 30.09329881001611,
      long: 31.208977384292677,
    ),
    Station(
      name: 'Ring Road',
      lat: 30.096492006226413,
      long: 31.199536008676063,
    ),
    Station(
      name: 'Rod El Farag Corridor',
      lat: 30.102079851388318,
      long: 31.18449418044273,
    ),
  ];

  final interchangeStations = [
    Station(
      name: 'Cairo University',
      lat: 30.026014663259826,
      long: 31.201170623881445,
    ),
    Station(name: 'Kit Kat', lat: 30.066509116768135, long: 31.212961840992747),
    Station(name: 'Sadat', lat: 30.044194805436348, long: 31.234360808075333),
    Station(name: 'Nasser', lat: 30.05359019591518, long: 31.238744074342822),
    Station(name: 'Attaba', lat: 30.052334683387546, long: 31.24680300724532),
    Station(
      name: 'Al Shohadaa',
      lat: 30.061112499905622,
      long: 31.246118673542604,
    ),
  ];

  // Derived lists of station names for routing logic
  late final List<String> line1Names = line1.map((s) => s.name).toList();
  late final List<String> line2Names = line2.map((s) => s.name).toList();
  late final List<String> line3CUNames = line3CU.map((s) => s.name).toList();
  late final List<String> line3RElfaragNames = line3RElfarag
      .map((s) => s.name)
      .toList();
  late final List<String> interchangeStationNames = interchangeStations
      .map((s) => s.name)
      .toList();

  late final List<Station> allStations = <Station>{
    ...line1,
    ...line2,
    ...line3CU,
    ...line3RElfarag,
  }.toList();

  var sorted = <Station>[];

  @override
  Widget build(BuildContext context) {
    final user = Get.arguments['name'] ?? 'Guest';
    sorted.assignAll(allStations.sortedBy((s) => s.name));
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Welcome $user',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'times new roman',
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: (String a) {
                        textEnabled.value = a.trim().isNotEmpty;
                      },
                      controller: placeController,
                      style: TextStyle(
                        fontFamily: 'Times new roman',
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Where are u now',
                        label: Text('Street Name'),
                        labelStyle: TextStyle(
                          fontFamily: 'times new roman',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Obx(() {
                    return OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: StadiumBorder(),
                        disabledBackgroundColor: Colors.grey,
                      ),

                      onPressed: textEnabled.value
                          ? () async {
                              await _findNearestStationForPlace();
                            }
                          : null,
                      child: Text(
                        'Show',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Times new roman',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Obx(() {
                    return Text(
                      '${station.value}',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  }),
                  IconButton(
                    onPressed: () async {
                      await _findNearestStationForCurrentLocation();
                    },
                    icon: Icon(Icons.map_rounded, color: Colors.black),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownMenu<String>(
                textStyle: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Times new roman',
                  color: Colors.black,
                ),
                hintText: 'Select Start Station',

                width: double.infinity,
                enableSearch: true,
                enableFilter: true,
                requestFocusOnTap: true,
                controller: startController,
                menuHeight: 250,
                menuStyle: MenuStyle(
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                ),
                inputDecorationTheme: InputDecorationTheme(
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    fontFamily: 'times new roman',
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),

                onSelected: (value) {
                  buttonEnabled.value =
                      startController.text.isNotEmpty &&
                      lastController.text.isNotEmpty;
                },
                dropdownMenuEntries: [
                  for (var station in sorted)
                    DropdownMenuEntry(value: station.name, label: station.name),
                ],
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownMenu<String>(
                textStyle: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Times new roman',
                  color: Colors.black,
                ),
                hintText: 'Select Last Station',
                enableSearch: true,
                enableFilter: true,
                requestFocusOnTap: true,
                width: double.infinity,
                controller: lastController,
                menuHeight: 250,
                menuStyle: MenuStyle(
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                ),
                inputDecorationTheme: InputDecorationTheme(
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    fontFamily: 'times new roman',
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),

                dropdownMenuEntries: [
                  for (var station in sorted)
                    DropdownMenuEntry(value: station.name, label: station.name),
                ],
                onSelected: (value) {
                  buttonEnabled.value =
                      startController.text.isNotEmpty &&
                      lastController.text.isNotEmpty;
                },
              ),
            ),
            SizedBox(height: 16),
            Obx(() {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: StadiumBorder(),
                      disabledBackgroundColor: Colors.grey,
                    ),
                    onPressed: buttonEnabled.value
                        ? () {
                            final stations = findRoute(
                              startController.text,
                              lastController.text,
                            );
                            Get.to(
                              GetDetailsPage(),
                              arguments: {'stations': stations},
                            );
                          }
                        : null,
                    child: Text(
                      'Get Details',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Times new roman',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }

  Future<void> _findNearestStationForPlace() async {
    final query = placeController.text.trim();
    if (query.isEmpty) {
      Get.snackbar('Error', 'Please enter a place name');
      return;
    }

    try {
      final List<Location> locations = await locationFromAddress(query);
      if (locations.isEmpty) {
        Get.snackbar('Error', 'Location not found');
        return;
      }

      final Location location = locations.first;
      final nearestStation = _findNearestStation(
        location.latitude,
        location.longitude,
      );

      station.value = 'Nearest station: ${nearestStation.name}';
    } catch (e) {
      Get.snackbar('Error', 'Failed to find location: $e');
    }
  }

  Future<void> _findNearestStationForCurrentLocation() async {
    try {
      final Position position = await _getCurrentPosition();
      final nearestStation = _findNearestStation(
        position.latitude,
        position.longitude,
      );

      station.value = 'Nearest station: ${nearestStation.name}';
    } catch (e) {
      Get.snackbar('Error', 'Failed to get current location: $e');
    }
  }

  Future<Position> _getCurrentPosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception('Location permissions are permanently denied');
    }

    return await Geolocator.getCurrentPosition();
  }

  Station _findNearestStation(double lat, double long) {
    Station nearest = allStations.first;
    double shortestDistance = Geolocator.distanceBetween(
      lat,
      long,
      nearest.lat,
      nearest.long,
    );

    for (final station in allStations) {
      final distance = Geolocator.distanceBetween(
        lat,
        long,
        station.lat,
        station.long,
      );

      if (distance < shortestDistance) {
        shortestDistance = distance;
        nearest = station;
      }
    }

    return nearest;
  }

  List<String> findRoute(String start, String end) {
    if (line1Names.contains(start) && line1Names.contains(end)) {
      return getSublist(line1Names, start, end);
    }
    if (line2Names.contains(start) && line2Names.contains(end)) {
      return getSublist(line2Names, start, end);
    }
    if (line3CUNames.contains(start) && line3CUNames.contains(end)) {
      return getSublist(line3CUNames, start, end);
    }
    if (line3RElfaragNames.contains(start) &&
        line3RElfaragNames.contains(end)) {
      return getSublist(line3RElfaragNames, start, end);
    }
    for (final change in interchangeStationNames) {
      if (line1Names.contains(start) &&
          line2Names.contains(end) &&
          line1Names.contains(change) &&
          line2Names.contains(change)) {
        return getSublist(line1Names, start, change) +
            getSublist(line2Names, change, end).sublist(1);
      }
      if (line2Names.contains(start) &&
          line1Names.contains(end) &&
          line2Names.contains(change) &&
          line1Names.contains(change)) {
        return getSublist(line2Names, start, change) +
            getSublist(line1Names, change, end).sublist(1);
      }
      if (line1Names.contains(start) &&
          line3CUNames.contains(end) &&
          line1Names.contains(change) &&
          line3CUNames.contains(change)) {
        return getSublist(line1Names, start, change) +
            getSublist(line3CUNames, change, end).sublist(1);
      }
      if (line3CUNames.contains(start) &&
          line1Names.contains(end) &&
          line3CUNames.contains(change) &&
          line1Names.contains(change)) {
        return getSublist(line3CUNames, start, change) +
            getSublist(line1Names, change, end).sublist(1);
      }
      if (line1Names.contains(start) &&
          line3RElfaragNames.contains(end) &&
          line1Names.contains(change) &&
          line3RElfaragNames.contains(change)) {
        return getSublist(line1Names, start, change) +
            getSublist(line3RElfaragNames, change, end).sublist(1);
      }
      if (line3RElfaragNames.contains(start) &&
          line1Names.contains(end) &&
          line3RElfaragNames.contains(change) &&
          line1Names.contains(change)) {
        return getSublist(line3RElfaragNames, start, change) +
            getSublist(line1Names, change, end).sublist(1);
      }
      if (line2Names.contains(start) &&
          line3CUNames.contains(end) &&
          line2Names.contains(change) &&
          line3CUNames.contains(change)) {
        return getSublist(line2Names, start, change) +
            getSublist(line3CUNames, change, end).sublist(1);
      }
      if (line3CUNames.contains(start) &&
          line2Names.contains(end) &&
          line3CUNames.contains(change) &&
          line2Names.contains(change)) {
        return getSublist(line3CUNames, start, change) +
            getSublist(line2Names, change, end).sublist(1);
      }
      if (line2Names.contains(start) &&
          line3RElfaragNames.contains(end) &&
          line2Names.contains(change) &&
          line3RElfaragNames.contains(change)) {
        return getSublist(line2Names, start, change) +
            getSublist(line3RElfaragNames, change, end).sublist(1);
      }
      if (line3RElfaragNames.contains(start) &&
          line2Names.contains(end) &&
          line3RElfaragNames.contains(change) &&
          line2Names.contains(change)) {
        return getSublist(line3RElfaragNames, start, change) +
            getSublist(line2Names, change, end).sublist(1);
      }
      if (line3CUNames.contains(start) &&
          line3RElfaragNames.contains(end) &&
          line3CUNames.contains(change) &&
          line3RElfaragNames.contains(change)) {
        return getSublist(line3CUNames, start, change) +
            getSublist(line3RElfaragNames, change, end).sublist(1);
      }
      if (line3RElfaragNames.contains(start) &&
          line3CUNames.contains(end) &&
          line3RElfaragNames.contains(change) &&
          line3CUNames.contains(change)) {
        return getSublist(line3RElfaragNames, start, change) +
            getSublist(line3CUNames, change, end).sublist(1);
      }
    }
    return ["Route not found"];
  }

  List<String> getSublist(List<String> line, String start, String end) {
    int x = line.indexOf(start);
    int y = line.indexOf(end);
    if (x < y) {
      return line.sublist(x, y + 1);
    } else {
      return line.sublist(y, x + 1).reversed.toList();
    }
  }
}
