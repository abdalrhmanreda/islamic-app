import 'package:url_launcher/url_launcher.dart';

Future<void> launchUrlMethod({required String link}) async {
  Uri url = Uri.parse(link);
  await launchUrl(url);
}
