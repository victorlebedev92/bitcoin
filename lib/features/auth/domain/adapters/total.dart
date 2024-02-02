import 'package:hive/hive.dart';

part 'total.g.dart';

@HiveType(typeId: 15)
class Total {
  @HiveField(0)
  double positions;

  Total({
    required this.positions,
  });
}
