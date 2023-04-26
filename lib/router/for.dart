import 'package:url_launcher/url_launcher.dart';

class MapUtils {
  MapUtils._();

  static Future<void> openMap(double latitude, double longitude) async {
    Uri googleUrl = Uri(
      path:
          'https://www.google.com/search?q=google+map&rlz=1C1GCEA_enEG1038EG1038&oq=&aqs=chrome.0.35i39i362l8.6268103j0j7&sourceid=chrome&ie=UTF-8',
      scheme: 'https',
      // host: 'dart.dev',
      fragment: 'numbers',
    );

    await launchUrl(googleUrl);
  }
}

// https://www.google.com/maps/search/?api=1&query=$latitude,$longitude