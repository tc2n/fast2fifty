import 'package:flutter/material.dart';
import 'sharedVariables.dart';
import 'constants.dart';
import 'dart:async';
import 'tiles.dart';
import 'package:auto_size_text/auto_size_text.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    numbersa.shuffle();
    numbersb.shuffle();
    numbers = numbersa + numbersb;
    startTimer();
  }

/////////////////////////////////////This is not working for some reason which generates listTiles dynamically///////////////////////////////////
  // void buildTilesList(double width) {
  //   for (int i = 0; i < tileSize; i++) {
  //     tilesTop.add(Row(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: buildInnerTiles(tileSize, i, 1, width),
  //     ));
  //     tilesBottom.add(Row(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: buildInnerTiles(tileSize, i, 0, width),
  //     ));
  //   }
  // }

  // List<Widget> buildInnerTiles(int size, int current, int index, double width) {
  //   print('this function is also called');
  //   //0 index is for bottom tiles, 1 is for top tiles initially visible
  //   List<Widget> tileList = [];

  //     if(index==1)
  //       for (int i = 0; i < size; i++) {
  //         tileList.add(
  //           GestureDetectorContainer(
  //               number: numbers[(size * current) + i],
  //               width: width / (size + 1),
  //               showIndex: (size * current) + i),
  //         );
  //       }
  //     if(index==0)
  //       for (int i = 0; i < size; i++) {
  //         tileList.add(
  //           GestureDetectorContainer(
  //               number: numbers[(size * current) + i + (size * size)],
  //               width: width / (size + 1),
  //               showIndex: (size * current) + i + (size * size)),
  //         );

  //   }

  //   return tileList;
  // }

  final dur = const Duration(milliseconds: 100);

  void startTimer() {
    Timer(dur, updateTime);
  }

  void updateTime() {
    if (stopwatch.isRunning) {
      startTimer();
    } else {
      startTimer();
    }

    setState(() {
      displayTime = (stopwatch.elapsed.inMinutes % 60)
              .toString()
              .padLeft(2, '0') +
          ':' +
          (stopwatch.elapsed.inSeconds % 60).toString().padLeft(2, '0') +
          ':' +
          (stopwatch.elapsed.inMilliseconds %100).toString().padLeft(2, '0');
    });
  }

////////////////////////This Dropdown Button is not used as dynamically changing tiles size is not implemented//////////////////
  DropdownButton<int> androidDropdown() {
    List<DropdownMenuItem<int>> dropdownItems = [];
    for (int i = 2; i < 7; i++) {
      var newItem = DropdownMenuItem(
        child: Text('$i x $i'),
        value: i,
      );
      dropdownItems.add(newItem);
    }

    return DropdownButton<int>(
      value: tileSize,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          tileSize = value;
        });
      },
    );
  }
  /////////////////////////////////////////////Ignore the above Code///////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0.0,
        title: Center(
          child: Text('Fast2Fifty'),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment(0.0, -0.55),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                // TODO: uncomment below code and implement dynamically generating tiles.
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: <Widget>[
                //     Text(
                //       'Size:',
                //       style: TextStyle(fontSize: 18, color: white60),
                //     ),
                //     Padding(
                //       padding: const EdgeInsets.symmetric(
                //           horizontal: 10, vertical: 8.0),
                //       child: androidDropdown(),
                //     ),
                //   ],
                // ),
                Text(
                  'Touch from 0 to ${tileSize * tileSize * 2} as fast as you can',
                  style: TextStyle(fontSize: 18, color: white60),
                ),
                SizedBox(
                  height: 20,
                ),
                RaisedButton(
                  color: accentColor,
                  onPressed: () {
                    stopwatch.stop();
                    stopwatch.reset();
                    setState(() {
                      firsttapdone=false;
                      numbersa.shuffle();
                      numbersb.shuffle();
                      numbers = numbersa + numbersb;
                      expected=1;
                      show = List<bool>.filled(50, true);
                    });
                  },
                  child: Container(
                    child: Text(
                      'Restart',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //Below align is for time
          Align(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Hero(
                tag: 'time',
                child: AutoSizeText(
                  displayTime,
                  maxLines: 1,
                  style: TextStyle(fontSize: 35, color: Colors.white, decoration: TextDecoration.none, fontWeight: FontWeight.normal),
                ),
              ),
            ),
            alignment: Alignment.bottomCenter,
          ),
          //Below Positions are for the tiles
          Positioned(
            bottom: 70,
            //TODO: check this width
            left: (width / 12)-6,
            child: Container(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetectorContainer(
                          number: numbers[26], width: width / 6, showIndex: 26),
                      GestureDetectorContainer(
                          number: numbers[27], width: width / 6, showIndex: 27),
                      GestureDetectorContainer(
                          number: numbers[28], width: width / 6, showIndex: 28),
                      GestureDetectorContainer(
                          number: numbers[29], width: width / 6, showIndex: 29),
                      GestureDetectorContainer(
                          number: numbers[30], width: width / 6, showIndex: 30),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetectorContainer(
                          number: numbers[31], width: width / 6, showIndex: 31),
                      GestureDetectorContainer(
                          number: numbers[32], width: width / 6, showIndex: 32),
                      GestureDetectorContainer(
                          number: numbers[33], width: width / 6, showIndex: 33),
                      GestureDetectorContainer(
                          number: numbers[34], width: width / 6, showIndex: 34),
                      GestureDetectorContainer(
                          number: numbers[35], width: width / 6, showIndex: 35),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetectorContainer(
                          number: numbers[36], width: width / 6, showIndex: 36),
                      GestureDetectorContainer(
                          number: numbers[37], width: width / 6, showIndex: 37),
                      GestureDetectorContainer(
                          number: numbers[38], width: width / 6, showIndex: 38),
                      GestureDetectorContainer(
                          number: numbers[39], width: width / 6, showIndex: 39),
                      GestureDetectorContainer(
                          number: numbers[40], width: width / 6, showIndex: 40),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetectorContainer(
                          number: numbers[41], width: width / 6, showIndex: 41),
                      GestureDetectorContainer(
                          number: numbers[42], width: width / 6, showIndex: 42),
                      GestureDetectorContainer(
                          number: numbers[43], width: width / 6, showIndex: 43),
                      GestureDetectorContainer(
                          number: numbers[44], width: width / 6, showIndex: 44),
                      GestureDetectorContainer(
                          number: numbers[45], width: width / 6, showIndex: 45),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetectorContainer(
                          number: numbers[46], width: width / 6, showIndex: 46),
                      GestureDetectorContainer(
                          number: numbers[47], width: width / 6, showIndex: 47),
                      GestureDetectorContainer(
                          number: numbers[48], width: width / 6, showIndex: 48),
                      GestureDetectorContainer(
                          number: numbers[49], width: width / 6, showIndex: 49),
                      GestureDetectorContainer(
                          number: numbers[25], width: width / 6, showIndex: 25),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 70,
            //TODO: check this width
            left: (width / 12)-6,
            child: Container(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetectorContainer(
                          number: numbers[0], width: width / 6, showIndex: 0),
                      GestureDetectorContainer(
                          number: numbers[1], width: width / 6, showIndex: 1),
                      GestureDetectorContainer(
                          number: numbers[2], width: width / 6, showIndex: 2),
                      GestureDetectorContainer(
                          number: numbers[3], width: width / 6, showIndex: 3),
                      GestureDetectorContainer(
                          number: numbers[4], width: width / 6, showIndex: 4),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetectorContainer(
                          number: numbers[5], width: width / 6, showIndex: 5),
                      GestureDetectorContainer(
                          number: numbers[6], width: width / 6, showIndex: 6),
                      GestureDetectorContainer(
                          number: numbers[7], width: width / 6, showIndex: 7),
                      GestureDetectorContainer(
                          number: numbers[8], width: width / 6, showIndex: 8),
                      GestureDetectorContainer(
                          number: numbers[9], width: width / 6, showIndex: 9),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetectorContainer(
                          number: numbers[10], width: width / 6, showIndex: 10),
                      GestureDetectorContainer(
                          number: numbers[11], width: width / 6, showIndex: 11),
                      GestureDetectorContainer(
                          number: numbers[12], width: width / 6, showIndex: 12),
                      GestureDetectorContainer(
                          number: numbers[13], width: width / 6, showIndex: 13),
                      GestureDetectorContainer(
                          number: numbers[14], width: width / 6, showIndex: 14),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetectorContainer(
                          number: numbers[15], width: width / 6, showIndex: 15),
                      GestureDetectorContainer(
                          number: numbers[16], width: width / 6, showIndex: 16),
                      GestureDetectorContainer(
                          number: numbers[17], width: width / 6, showIndex: 17),
                      GestureDetectorContainer(
                          number: numbers[18], width: width / 6, showIndex: 18),
                      GestureDetectorContainer(
                          number: numbers[19], width: width / 6, showIndex: 19),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetectorContainer(
                          number: numbers[20], width: width / 6, showIndex: 20),
                      GestureDetectorContainer(
                          number: numbers[21], width: width / 6, showIndex: 21),
                      GestureDetectorContainer(
                          number: numbers[22], width: width / 6, showIndex: 22),
                      GestureDetectorContainer(
                          number: numbers[23], width: width / 6, showIndex: 23),
                      GestureDetectorContainer(
                          number: numbers[24], width: width / 6, showIndex: 24),
                    ],
                  ),
                ],
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}
