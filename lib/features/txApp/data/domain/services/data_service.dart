import 'package:get_it/get_it.dart';
import 'package:bitcoin_wallet/features/txApp/data/domain/models/data.dart';

class DataService {
  static DataService instance = GetIt.I.get<DataService>();

  final Data data = Data();
}
