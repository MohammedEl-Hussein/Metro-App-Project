import 'package:floor/floor.dart';
import 'package:metrohelper/lines_dao.dart';
import 'package:metrohelper/lines_stations_dao.dart';
import 'package:metrohelper/stations.dart';
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'line_stations.dart';
import 'lines.dart';
import 'stations_dao.dart';

part 'metro_database.g.dart';

@Database(version: 1, entities: [Line, Station, LineStation])
abstract class MetroDatabase extends FloorDatabase {
  StationDao get stationDao;
  LineDao get lineDao;
  LineStationDao get lineStationDao;
}
