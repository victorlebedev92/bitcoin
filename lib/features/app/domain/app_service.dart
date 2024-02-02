import 'package:get_it/get_it.dart';
import 'package:bitcoin_wallet/features/auth/domain/auth_service.dart';
import 'package:bitcoin_wallet/features/settings/domain/settings_service.dart';

class AppService {
  static final AppService instance = GetIt.I.registerSingleton(AppService._());
  final AuthService authService = AuthService();
  final SettingsService settingsService = SettingsService();

  void clearAllBox() {
    authService.boxClear();
    settingsService.boxClear();
  }

  AppService._();

  factory AppService() => instance;
}
