import 'package:floor/floor.dart';
import 'package:metrohelper/stations.dart';

import 'lines.dart';

@Entity(
  tableName: 'line_stations',
  primaryKeys: ['lineId', 'stationId'],
  foreignKeys: [
    ForeignKey(
      childColumns: ['lineId'],
      parentColumns: ['lineId'],
      entity: Line,
    ),
    ForeignKey(
      childColumns: ['stationId'],
      parentColumns: ['stationId'],
      entity: Station,
    ),
  ],
)
class LineStation {
  final int lineId;
  final int stationId;
  final int position;

  LineStation({
    required this.lineId,
    required this.stationId,
    required this.position,
  });
}
