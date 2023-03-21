import 'package:get_storage/get_storage.dart';

class AppSettingsData {
  //singleton pattern to make only one connection to the database
  AppSettingsData._();
  static final AppSettingsData _appSettingsData = AppSettingsData._();
  static AppSettingsData get instance => _appSettingsData;
  //instance of the database
  final box = GetStorage('app_settings');
//get the language from the database
  String? get language => box.read<String>('language') ?? 'en';
  void setLanguage(String language) {
    box.write('language', language);
    box.save();
  }

//get the isDarkMode from the database
  bool? get isDarkMode => box.read<bool>('isDarkMode') ?? false;
  void setIsDarkMode(bool isDarkMode) {
    box.write('isDarkMode', isDarkMode);
    box.save();
  }
}
