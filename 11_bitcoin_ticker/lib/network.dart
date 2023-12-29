import 'dart:convert';

import 'package:bitcoin_ticker/data_model.dart';
import 'package:http/http.dart' as http;

fetchbitCoinExchangeRates (String currency) async {
  String url = 'https://rest.coinapi.io/v1/exchangerate/BTC/$currency';
  var responseValue;
  await fetchExchangeRates(currency, url).then((value) => {
    responseValue = value
  });
  return responseValue;
}

fecthETHExchangeRates (String currency) async {
  String url = 'https://rest.coinapi.io/v1/exchangerate/ETH/$currency';
  var responseValue;
  await fetchExchangeRates(currency, url).then((value) => {
    responseValue = value
  });
  return responseValue;
}

fetchLTHExchangeRates (String currency) async {
  var responseValue;
  String url = 'https://rest.coinapi.io/v1/exchangerate/LTC/$currency';
  await fetchExchangeRates(currency, url).then((value) => {
    responseValue = value
  });
  return responseValue;
}

Future fetchExchangeRates(String currency, url) async {
  Map<String, String> objHeaders = {
    'X-CoinAPI-Key': '4D47B046-4DA1-4565-A272-3EB31522B7B1'
    //'X-CoinAPI-Key': '5CAD18F5-9A92-43AB-942C-CD2C4F6C8A32'
  };
  return http
      .get(
          Uri.parse(url,),
          headers: objHeaders)
      .then((http.Response response) {

    if (response.statusCode == 200) {
      return DataModel.fromJson(jsonDecode(response.body));
    } else {
      return response.statusCode;
    }
  });
}