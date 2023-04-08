import 'package:akademi_etkinlik/services/data_service.dart';

class UserConfig {
  UserConfig._();

  static bool admin = false;

  static Future<void> adminCheck() async {
    final bool result = await DataService.adminCheck();
    admin = result;
  }
}
