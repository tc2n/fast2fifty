import 'package:flutter/material.dart';

List<int> numbersa = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25];
List<int> numbersb = [26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50];
List<int> numbers;
List<bool> show = List<bool>.filled(50, true);
int expected = 1;
String displayTime = '00:00:00';
int tileSize = 5;
bool firsttapdone = false;
String resultText = 'You can do better';

List<Widget> tilesTop = [];
List<Widget> tilesBottom = [];

var stopwatch = Stopwatch();