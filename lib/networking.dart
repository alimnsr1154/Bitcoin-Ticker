import 'package:http/http.dart' as http;
import 'coin_data.dart';
import 'dart:convert';
import 'price_screen.dart';

const apikey = 'BF636775-6B1C-4728-A705-133693FB2048';
Map<String, String> cryptoprices = {};

class Networking {
  Future getData(String select) async {
    int temp = 0;
    for (String crypto in cryptoList) {
      //Update the URL to use the crypto symbol from the cryptoList
      String requestURL =
          'https://rest.coinapi.io/v1/exchangerate/$crypto/$select?apikey=$apikey';
      http.Response response = await http.get(Uri.parse(requestURL));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        //print(temp);
        double Price = data['rate'];
        cryptoprices[crypto] = Price.toStringAsFixed(0);
        // print(cryptoprices[0]);
        temp++;
      } else {
        print(temp);
        print(response.statusCode);
      }
    }
    return cryptoprices;
  }
}
