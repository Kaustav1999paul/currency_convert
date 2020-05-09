import 'package:flutter/material.dart';

import 'currencyservice.dart';


class InputRedPage extends StatefulWidget {
  final origCurrency;
  final convCurrency;

  InputRedPage({this.origCurrency, this.convCurrency});

  @override
  _InputRedPageState createState() => _InputRedPageState();
}

class _InputRedPageState extends State<InputRedPage> {
  var currInput = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEC5759),
      body: Column(
        children: <Widget>[
          SizedBox(height: 80.0),
          Center(
            child: Text(
              currInput.toString(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 100.0,
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 50.0),
          numberRow(1, 2, 3),
          SizedBox(height: 25.0),
          numberRow(4, 5, 6),
          SizedBox(height: 25.0),
          numberRow(7, 8, 9),
          SizedBox(height: 25.0),
          finalRow()
        ],
      ),
    );
  }

  Widget numberRow(number1, number2, number3) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        InkWell(
          onTap: () {
            calculateNumber(number1);
          },
          child: Container(
            height: 90.0,
            width: 90.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                color: Color(0xFFB73434)),
            child: Center(
              child: Text(
                number1.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            calculateNumber(number2);
          },
          child: Container(
            height: 90.0,
            width: 90.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                color: Color(0xFFB73434)),
            child: Center(
              child: Text(
                number2.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            calculateNumber(number3);
          },
          child: Container(
            height: 90.0,
            width: 90.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                color: Color(0xFFB73434)),
            child: Center(
              child: Text(
                number3.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget finalRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        InkWell(
          onTap: () {
            // calculateNumber(number1);
          },
          child: Container(
            height: 90.0,
            width: 90.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                color: Color(0xFFB73434)),
            child: Center(
              child: Text(
                '.',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            calculateNumber(0);
          },
          child: Container(
            height: 90.0,
            width: 90.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                color: Color(0xFFB73434)),
            child: Center(
              child: Text(
                0.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            CurrencyService().convertCurrency(
                widget.origCurrency, widget.convCurrency, currInput, context);
          },
          child: Container(
            height: 90.0,
            width: 90.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0), color: Colors.white),
            child: Center(
                child: Icon(
              Icons.check,
              color: Color(0xFFFC1514),
              size: 25.0,
            )),
          ),
        )
      ],
    );
  }

  calculateNumber(number) {
    if (currInput == 0) {
      setState(() {
        currInput = number;
      });
    } else {
      setState(() {
        currInput = (currInput * 10) + number;
      });
    }
  }
}
