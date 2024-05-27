import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:clima_no_name_company/utilities/constants.dart';
import 'package:clima_no_name_company/services/location.dart';


class NetworkHelper
{
  String CN = "NetworkHelper";
  Location location = Location();

  Future getData() async
  {
    String MN = "getData";
    // 1.- Get location
    String latitude  =  await location.getLat();
    String longitude  =  await location.getLat();
    print("$CN.$MN: Phone's latitude:$latitude, longitude:$longitude");

    String url = "${kOpenWeatherAPIUtl}lat=$latitude&lon=$longitude&appid=$kOpenWeatherAPIKey&units=metric";
    print("$CN.$MN: Open Weather request URL:$url");

    http.Response response = await http.get(Uri.parse(url));
    if ( response.statusCode == 200 )
    {
      return jsonDecode(response.body);
    }
    else
    {
      print("!!! $CN.$MN: : something went wrong when fetching data , statusCode:${response.statusCode}");
    }
  }
}
