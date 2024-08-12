import 'package:intl/intl.dart';

bool isArabic() {
  return Intl.getCurrentLocale() == "en_us" ? false : true;
}
