import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../util/coin_data.dart';
import 'dart:io' show Platform;
import 'package:bitcoin_ticker/serv/coinBrain.dart';
import 'package:bitcoin_ticker/util/constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key, required this.title});

  final String title;

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  String CN = "_MainHomePageState";
  String? selectedCurrency = 'AUD';
  String currentRate = "?";

  List<String> rates = ["?","?","?"];

  @override
  void initState()
  {
    getCoinData(selectedCurrency);
  }
  void getCoinData(String? currency) async
  {
    String MN = "getCoinData";

    for (int i = 0; i < cryptoList.length; i++)
    {
      try{
        var coinData = await CoinBrain().getCoinData(cryptoList[i], currency);
        print("$CN.$MN: $coinData");
        setState(() {
          rates.insert(i, coinData[kCoinDataKey].toStringAsFixed(0));
        });
        print("$CN.$MN: crypto: ${cryptoList[i]}, rate : ${rates[i]}, currency: $currency");
      }
      catch(e)
      {
        print("!!!$CN.$MN: $e");
      }
    }
  }
  DropdownButton<String> androidDropdown()
  {
    List<DropdownMenuItem<String>> dropdownItemsList = [];
    for( String currency in currenciesList )
    {
      dropdownItemsList.add(
          DropdownMenuItem(
            child: Text(currency),
            value: currency)
      );
    }
    //return dropdownItemsList;
    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropdownItemsList,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
          getCoinData(selectedCurrency);
        });
      },
    );
  }
  CupertinoPicker iOSPicker()
  {
    List<Text> tmpPickerItemsList = [];
    for( String currenty in currenciesList)
      {
        tmpPickerItemsList.add(Text(currenty));
      }
    return CupertinoPicker(
        itemExtent: 32.0,
        onSelectedItemChanged:(selectedItem){
          setState(() {
            selectedCurrency = currenciesList[selectedItem];
            getCoinData(selectedCurrency);
            print(currenciesList[selectedItem]);
          });
        },
        children: tmpPickerItemsList
    );
  }
  List<Card> getCardItems()
  {
    List<Card> tmpCardList = [];
    for( String crypto in cryptoList )
    {
      tmpCardList.add(Card(
          color: Colors.red,
          elevation: 5.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding:
            EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
            child: Text(
              '1 $crypto = ${rates[cryptoList.indexOf(crypto)]} $selectedCurrency',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.0, color: Colors.white),
            ),
          ),
        )
      );
    }
    return tmpCardList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: getCardItems()
              ),
            ),
            Container(
              height: 150.0,
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 30.0),
              color: Colors.yellow,
              child: Platform.isIOS ? iOSPicker() : androidDropdown()
            )
          ],
        ));
  }
}