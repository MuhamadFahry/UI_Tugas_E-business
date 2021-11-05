import 'package:url_launcher/url_launcher.dart';

class Kontak {
  static Future openWhatsapp({String? phoneNumber}) async {
    final url = 'https://wa.me/$phoneNumber';

    await _lauchUrl(url);
  }

  static Future _lauchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }
}
