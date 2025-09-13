import 'package:floor/floor.dart';

@Entity(tableName: 'stations')
class Station {
  @PrimaryKey(autoGenerate: true)
  final int? stationId;

  final String name;
  final double latitude;
  final double longitude;

  Station({
    this.stationId,
    required this.name,
    required this.latitude,
    required this.longitude,
  });
}
