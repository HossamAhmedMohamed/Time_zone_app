// ignore_for_file: unused_import, non_constant_identifier_names, unused_local_variable
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class Allcountries {
  final String countryName;
  final String flag;
  final String countryLink;

  Allcountries({
    required this.countryName,
    required this.flag,
    required this.countryLink,
  });

  late String timeZone;
  late String timeClock;
  late bool amOrpm;

  getData() async {
    Response response = await get(
        Uri.parse('http://worldtimeapi.org/api/timezone/$countryLink'));
    Map Data = jsonDecode(response.body);
    DateTime time = DateTime.parse(Data["utc_datetime"]);
    int offset = int.parse(Data["utc_offset"].substring(0, 3));
    DateTime real = time.add(Duration(hours: offset));

    if (real.hour > 5 && real.hour < 18) {
      amOrpm = true;
    } else {
      amOrpm = false;
    }
    timeClock = DateFormat('hh:mm a').format(real);
    timeZone = Data["timezone"];
  }
}
