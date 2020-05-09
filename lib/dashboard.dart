import 'package:currencyconvert/red_input.dart';
import 'package:currencyconvert/white_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'currency_list.dart';
import 'currencyservice.dart';

class DashboardPage extends StatefulWidget {
  final currencyVal;
  final convertedCurrency;
  final currencyone;
  final currencytwo;
  final isWhite;

  DashboardPage(
      {this.currencyVal,
      this.convertedCurrency,
      this.currencyone,
      this.currencytwo,
      this.isWhite});

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.white),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.red, Colors.pink])),
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
          ),
          Container(
            child: Center(
                child: Column(
              children: <Widget>[
                SizedBox(height: 80),
                InkWell(
                    onTap: () {
                      Navigator.of(context).push(CupertinoPageRoute(
                          builder: (context) => CurrencyList()));
                    },
                    child: Text(
                      CurrencyService().getCurrencyString(widget.currencyone),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.0,
                          fontFamily: 'Quicksand'),
                    )),
                SizedBox(height: 20.0),
                InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => InputRedPage(
                              origCurrency: widget.currencyone,
                              convCurrency: widget.currencytwo)));
                    },
                    child: Text(
                      widget.currencyVal.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 100.0,
                          fontFamily: 'Quicksand'),
                    )),
                SizedBox(height: 60.0),
                Container(
                  height: 155.0,
                  width: 155.0,
                  decoration: BoxDecoration(
                      gradient:
                          LinearGradient(colors: [Colors.red, Colors.pink]),
                      borderRadius: BorderRadius.circular(150),
                      border: Border.all(
                          color: Colors.white,
                          style: BorderStyle.solid,
                          width: 8)),
                  child: Center(
                    child: widget.isWhite
                        ? Icon(
                            Icons.arrow_upward,
                            size: 60.0,
                            color: Colors.white,
                          )
                        : Icon(
                            Icons.arrow_downward,
                            size: 60.0,
                            color: Colors.white,
                          ),
                  ),
                ),
                SizedBox(height: 40.0),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => InputWhitePage(
                            origCurrency: widget.currencyone,
                            convCurrency: widget.currencytwo)));
                  },
                  child: Text(
                    widget.convertedCurrency.toString(),
                    style: TextStyle(
                        color: Color(0xFFEC5759),
                        fontSize: 100,
                        fontFamily: 'Quicksand'),
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  CurrencyService().getCurrencyString(widget.currencytwo),
                  style: TextStyle(
                      color: Color(0xFFEC5759),
                      fontSize: 22.0,
                      fontFamily: 'Quicksand'),
                ),
              ],
            )),
          )
        ],
      ),
    );
  }
}
