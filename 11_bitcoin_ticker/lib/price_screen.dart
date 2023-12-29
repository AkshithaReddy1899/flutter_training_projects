import 'package:bitcoin_ticker/card.dart';
import 'package:bitcoin_ticker/network.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'coin_data.dart';
import 'package:loader_overlay/loader_overlay.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';
  dynamic bitCoinDataObj = '...';
  dynamic ethDataObj = '...';
  dynamic lthDataObj = '...';
  bool isLoadingbit = true;
  bool isLoadingEth = true;
  bool isLoadingLTH = true;
  bool error = false;

  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> dropdownITems = [];

    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownITems.add(newItem);
    }

    return DropdownButton(
        value: selectedCurrency,
        items: dropdownITems,
        onChanged: (value) {
          setState(() {
            selectedCurrency = value.toString();
            getExchangeRates(selectedCurrency);
          });
        });
  }

  getExchangeRates(selectedCurrency) async {
    setState(() {
      isLoadingEth = true;
      isLoadingLTH = true;
      isLoadingbit = true;
    });

    context.loaderOverlay.show();

    await fetchbitCoinExchangeRates(selectedCurrency).then((value) {
      if (value.runtimeType != int) {
        setState(() {
          bitCoinDataObj = value;
          isLoadingbit = false;
        });
      } else {
        Alert(
          context: context,
          title: 'Oops!',
          desc: 'Something went wrong please try again',
          buttons: [
            DialogButton(
              child: Text(
                "Try again",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => setState(() {}),
              width: 120,
            )
          ],
        ).show();
      }
    });
    await fecthETHExchangeRates(selectedCurrency).then((value) {
      if (value.runtimeType != int) {
        setState(() {
          ethDataObj = value;
          isLoadingEth = false;
        });
      }
    });
    await fetchLTHExchangeRates(selectedCurrency).then((value) {
      if (value.runtimeType != int) {
        setState(() {
          lthDataObj = value;
          isLoadingLTH = false;
        });
      }
    });

    context.loaderOverlay.hide();
  }

  @override
  void initState() {
    super.initState();
    getExchangeRates(selectedCurrency);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
        backgroundColor: Colors.lightBlueAccent,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.black87,
          statusBarBrightness: Brightness.dark,
        ),
      ),
      body: LoaderOverlay(
        overlayOpacity: 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  CardComponent(
                    text: (!isLoadingEth && !isLoadingLTH && !isLoadingbit)
                        ? '1 BTC = ${bitCoinDataObj.rate.toStringAsFixed(2)} $selectedCurrency'
                        : '1 BTC = ... $selectedCurrency',
                  ),
                  CardComponent(
                    text: (!isLoadingEth && !isLoadingLTH && !isLoadingbit)
                        ? '1 ETH = ${ethDataObj.rate.toStringAsFixed(2)} $selectedCurrency'
                        : '1 ETH = ... $selectedCurrency',
                  ),
                  CardComponent(
                      text: (!isLoadingEth && !isLoadingLTH && !isLoadingbit)
                          ? '1 LTH = ${lthDataObj.rate.toStringAsFixed(2)} $selectedCurrency'
                          : '1LTH = ... $selectedCurrency'),
                ],
              ),
            ),
            Spacer(),
            Container(
              height: 70.0,
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(bottom: 10.0),
              color: Colors.lightBlueAccent,
              child: androidDropdown(),
            ),
          ],
        ),
      ),
    );
  }
}
