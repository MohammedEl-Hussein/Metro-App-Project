import 'package:floor/floor.dart';

@Entity(tableName: 'lines')
class Line {
  @PrimaryKey(autoGenerate: true)
  final int? lineId;

  final String name;

  Line({required this.lineId, required this.name});
}
