import 'package:http/http.dart' as http;
import 'package:bitcoin_ticker/util/constants.dart';
import 'dart:convert';

class CoinBrain
{
  String CN = "CoinBrain";

  Future getCoinData(String cripto, String? currency) async
  {
    String MN = "getCoinData";

    String url = "$kBaseUrl$cripto/$currency$kCoinApiKey";
    print("$CN.$MN: CoinAPI request URL:$url");

    http.Response response = await http.get(Uri.parse(url));
    if( response.statusCode == 200 )
      {
        return jsonDecode(response.body);
      }
    else
      {
        print("!!! $CN.$MN: : something went wrong when fetching data , statusCode:${response.statusCode}");
      }
  }
}