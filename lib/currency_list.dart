import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dashboard.dart';


class CurrencyList extends StatefulWidget {
  @override
  _CurrencyListState createState() => _CurrencyListState();
}

class _CurrencyListState extends State<CurrencyList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.red,
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 30,),
                FloatingActionButton(
                  backgroundColor: Colors.white,
                  child:  Icon(Icons.arrow_back, color: Colors.red),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                SizedBox(height: 90,),
                getListItem('Russian Ruble', 'RUB'),
                SizedBox(height: 30,),
                getListItem('Indian Rupee', 'INR'),
                SizedBox(height: 30,),
                getListItem('Japanese Yen', 'JPY'),
                SizedBox(height: 30,),
                getListItem('Pound Sterling', 'GBP'),
              ],
            ),
          )),
    );
  }


  Widget getListItem(String currencyName, String currency) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushReplacement(CupertinoPageRoute(
            builder: (context) => DashboardPage(
                currencyVal: 0.0,
                isWhite: false,
                convertedCurrency: 0.0,
                currencyone: 'USD',
                currencytwo: currency)));
      },
      child: Padding(
        padding: EdgeInsets.only(left: 25.0, bottom: 20.0),
        child: Text(
          currencyName,
          style: TextStyle(
              fontFamily: 'Quicksand',
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
      ),
    );
  }
}
