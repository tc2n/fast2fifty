import 'package:flutter/material.dart';
import 'sharedVariables.dart';
import 'constants.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Results extends StatefulWidget {
  final String time;
  Results(this.time);

  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0.0,
        title: Center(
          child: Text('fast2fifty'),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Center(
            child: Hero(
              tag: 'time',
                          child: AutoSizeText(
                displayTime,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 100, color: Colors.white, decoration: TextDecoration.none, fontWeight: FontWeight.normal
                ),
              ),
            ),
          ),
          Center(
            child: Text(
             resultText,
             style: TextStyle(
              fontSize: 20,
              color: white60 
             ), 
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 70),
            child: RaisedButton(
                    onPressed: () {
                      stopwatch.reset();
                    setState(() {
                      firsttapdone=false;
                      numbersa.shuffle();
                      numbersb.shuffle();
                      numbers = numbersa + numbersb;
                      expected=1;
                      show = List<bool>.filled(50, true);
                    });
                      Navigator.pop(context);
                    },
                    child: Container(
                      child: Text(
                        'Restart',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
