import 'package:intl/intl.dart';



String format(num toFormat) {
  var f = new NumberFormat("###.0#", "en_US");
 return f.format(toFormat/1000);
}