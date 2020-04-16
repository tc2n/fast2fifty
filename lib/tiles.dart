import 'package:flutter/material.dart';
import 'sharedVariables.dart';
import 'resultsPage.dart';

class GestureDetectorContainer extends StatefulWidget {
  final int number;
  final double width;
  final int showIndex;
  GestureDetectorContainer({this.number, this.width, this.showIndex});
  @override
  _GestureDetectorContainerState createState() =>
      _GestureDetectorContainerState();
}

class _GestureDetectorContainerState extends State<GestureDetectorContainer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (numbers[widget.showIndex] == expected) {
            show[widget.showIndex] = false;
            expected++;
          }
        });
        if (firsttapdone == false) {
          firsttapdone = true;
          stopwatch.start();
        }
        if (expected == 51) {
          int time = stopwatch.elapsed.inSeconds;
          if(time<19){
            resultText='Impossible, you must have done magic.';
          } else if(time<29){
            resultText='You must be lying.';
          } else if(time<39) {
            resultText='You are special, you should invent another world to live';
          } else if(time<59) {
            resultText='You did that under a minute, Welldone';
          } else if(time< 69) {
            resultText='You are getting old, Buddy';
          } else {
            resultText='You are really old.';
          }
          stopwatch.stop();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Results(displayTime)),
          );
        }
      },
      child: NumberContainers(
          number: widget.number,
          height: (widget.width),
          show: show[widget.showIndex],
          lower: (widget.number>25) ? true : false,),
    );
  }
}

class NumberContainers extends StatelessWidget {
  final int number;
  final double height;
  bool show;
  final bool lower;
  NumberContainers({this.number, this.height, this.show, this.lower});

  @override
  Widget build(BuildContext context) {
    if (show) {
      return Container(
        margin: EdgeInsets.all(2),
        height: height,
        width: height,
        color: lower ? Colors.blue[900] : Colors.indigo[800],
        child: Center(
          child: Text(
            number.toString(),
            style: TextStyle(
              fontSize: 40,
            ),
          ),
        ),
      );
    }
    return Container(
      margin: EdgeInsets.all(2),
      height: height,
      width: height,
    );
  }
}
