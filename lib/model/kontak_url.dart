import 'package:url_launcher/url_launcher.dart';

class Kontak {
  static Future openWhatsapp({String? phoneNumber, String? subject}) async {
    final url = 'https://api.whatsapp.com/send?phone=$phoneNumber%0A$subject';

    await _lauchUrl(url);
  }

  static Future _lauchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }
}
