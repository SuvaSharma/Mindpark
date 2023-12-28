import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:collection/collection.dart';
import 'package:get/get.dart';
import 'package:mindgames/congrats1.dart';
import 'package:mindgames/hint1.dart';
import 'package:mindgames/level1page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';

class Level8page extends StatefulWidget {
  Level8page({Key? key}) : super(key: key);

  @override
  _Level8pageState createState() => _Level8pageState();
}

class _Level8pageState extends State<Level8page> with TickerProviderStateMixin {
  late AnimationController _animationController1;
  late Animation<double> _animation1;

  late AnimationController _animationController2;
  late Animation<double> _animation2;
  bool _secondTableVisible = false;

  late AnimationController _newTableAnimationController;
  late Animation<double> _newTableAnimation;
  bool _newTableVisible = false;

  late Timer _timer;
  int _seconds = 0;

  List<int> numbers = [];

  List<int?> droppedNumbers = [null, null, null, null, null];

  bool _isArrangementCorrect() {
    List<int?> correctArrangement = [3, 9, 0, 4, 2];
    bool iscorrect =
        const ListEquality().equals(droppedNumbers, correctArrangement);

    if (iscorrect) {
      _stopTimer();
      _showCongratsDialog();
    }
    return iscorrect;
  }

  bool _areallcellsfilled() {
    return droppedNumbers.every((number) => number != null);
  }

  @override
  void initState() {
    super.initState();

    _animationController1 = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _animation1 =
        Tween<double>(begin: 0.5, end: 1).animate(_animationController1);

    _animationController2 = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _animation2 =
        Tween<double>(begin: 0.25, end: 1).animate(_animationController2);

    _newTableAnimationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _newTableAnimation =
        Tween<double>(begin: 0.5, end: 1).animate(_newTableAnimationController);

    _animationController1.forward();

    // Delay the appearance of the second table by 2 seconds

    setState(() {
      _secondTableVisible = true;
      _animationController2.forward();
    });
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _seconds++;
      });
    });
  }

  void _stopTimer() {
    _timer.cancel();
  }

  void _showCongratsDialog() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int timeTaken = _seconds;

    // Retrieve existing game times
    List<int>? savedTimes =
        prefs.getStringList('game_times')?.map((e) => int.parse(e)).toList() ??
            [];
    savedTimes.add(timeTaken);

    // Store game times
    prefs.setStringList(
        'game_times', savedTimes.map((e) => e.toString()).toList());

    // Retrieve existing filled times
    List<int?> filledTimes =
        droppedNumbers.map((number) => number ?? 0).toList();
    List<List<int?>> savedFilledTimes = prefs
            .getStringList('filled_times')
            ?.map((e) => (json.decode(e) as List).cast<int?>())
            .toList() ??
        [];
    savedFilledTimes.add(filledTimes);

    // Store filled times
    prefs.setStringList(
        'filled_times', savedFilledTimes.map((e) => json.encode(e)).toList());

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            height: 350,
            width: 320,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                width: 3,
              ),
            ),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Congratulations!',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'You have succesfully completed the task in $_seconds seconds!',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ]),
          ),
        );
      },
    );
  }

  List<String> imageAssetPaths1 = [
    'assets/images/symbol1.png',
    'assets/images/symbol2.png',
    'assets/images/symbol3.png',
    'assets/images/symbol4.png',
    'assets/images/symbol5.png',
  ];

  List<String> imageAssetPaths2 = [
    'assets/images/symbol6.png',
    'assets/images/symbol7.png',
    'assets/images/symbol8.png',
    'assets/images/symbol9.png',
    'assets/images/info.png',
  ];

  List<String> imageAssetPaths3 = [
    'assets/images/symbol3.png',
    'assets/images/symbol9.png',
    'assets/images/info.png',
    'assets/images/symbol4.png',
    'assets/images/symbol2.png',
  ];

  List<List<String>> textData1 = [
    [' 1', ' 2', ' 3', ' 4', ' 5'],
    ['Text A', 'Text B', 'Text C', 'Text D', 'Text E'],
  ];

  List<List<String>> textData2 = [
    [' 6', ' 7', ' 8', ' 9', ' 0'],
    ['Text A', 'Text B', 'Text C', 'Text D', 'Text E'],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: SafeArea(
          child: Column(
            children: [
              // IconButton(
              //   icon: Icon(Icons.arrow_back),
              //   iconSize: 40,
              //   color: Colors.black,
              //   onPressed: () {
              //     Navigator.pop(context);
              //   },
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Processing Speed Test',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              AnimatedBuilder(
                animation: _animation1,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _animation1.value,
                    child: Container(
                      width: 400,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blueGrey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 10,
                            offset: Offset(0, 3),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Table(
                        border: TableBorder.all(
                          width: 2,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        children: List.generate(2, (rowIndex) {
                          return TableRow(
                            children: List.generate(5, (colIndex) {
                              if (rowIndex == 0) {
                                return TableCell(
                                  child: Image.asset(
                                    imageAssetPaths1[colIndex],
                                    height: 50,
                                  ),
                                );
                              } else if (rowIndex == 1) {
                                // Add text feature in the second row
                                return TableCell(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Text(
                                        textData1[rowIndex - 1][colIndex],
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              } else {
                                return TableCell(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text('Fallback'),
                                  ),
                                );
                              }
                            }),
                          );
                        }),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 50,
              ),
              // Add a conditional check to see if the second table should be visible
              if (_secondTableVisible)
                AnimatedBuilder(
                  animation: _animation2,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _animation2.value,
                      child: Container(
                        width: 400,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blueGrey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 10,
                              offset: Offset(0, 3),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Table(
                          border: TableBorder.all(
                            width: 2,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          children: List.generate(2, (rowIndex) {
                            return TableRow(
                              children: List.generate(5, (colIndex) {
                                if (rowIndex == 0) {
                                  return TableCell(
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        imageAssetPaths2[colIndex],
                                        height: 40,
                                      ),
                                    ),
                                  );
                                } else if (rowIndex == 1) {
                                  // Add text feature in the second row
                                  return TableCell(
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Center(
                                        child: Text(
                                          textData2[rowIndex - 1][colIndex],
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                } else {
                                  return TableCell(
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text('Fallback'),
                                    ),
                                  );
                                }
                              }),
                            );
                          }),
                        ),
                      ),
                    );
                  },
                ),
              SizedBox(
                height: 35,
              ),
              Container(
                width: 150,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(-28, -28),
                      color: Colors.white,
                      blurRadius: 30.0,
                    ),
                    BoxShadow(
                      color: Color(0xFFA7A9AF),
                      blurRadius: 30,
                      offset: Offset(28, 28),
                    ),
                  ],
                ),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      _newTableVisible = true;
                      _newTableAnimationController.forward();
                      _startTimer();

                      numbers = List.generate(10, (index) => index);
                    });
                  },
                  child: Text(
                    'Start',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              if (_newTableVisible)
                AnimatedBuilder(
                  animation: _newTableAnimation,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _newTableAnimation.value,
                      child: Material(
                        elevation: 15,
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          width: 400,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Table(
                            border: TableBorder.all(
                              width: 2,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            children: List.generate(2, (rowIndex) {
                              return TableRow(
                                children: List.generate(5, (colIndex) {
                                  if (rowIndex == 0) {
                                    return TableCell(
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Image.asset(
                                          imageAssetPaths3[colIndex],
                                          height: 40,
                                        ),
                                      ),
                                    );
                                  } else if (rowIndex == 1) {
                                    return TableCell(
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: DragTarget<int>(
                                          builder: (
                                            BuildContext context,
                                            List<dynamic> accepted,
                                            List<dynamic> rejected,
                                          ) {
                                            return Container(
                                                height: 40,
                                                width: 35,
                                                padding: EdgeInsets.all(8.0),
                                                color: _isArrangementCorrect()
                                                    ? Colors.green
                                                    : _areallcellsfilled()
                                                        ? Colors.red
                                                        : Colors.transparent,
                                                child: Text(
                                                  droppedNumbers[colIndex] !=
                                                          null
                                                      ? droppedNumbers[
                                                              colIndex]!
                                                          .toString()
                                                      : '',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ));
                                          },
                                          onWillAccept: (data) {
                                            print("Will accept: $data");
                                            return true;
                                          },
                                          onAccept: (data) {
                                            print("Accepted: $data");
                                            setState(() {
                                              droppedNumbers[colIndex] = data;
                                            });
                                            _isArrangementCorrect();
                                          },
                                        ),
                                      ),
                                    );
                                  } else {
                                    return TableCell(
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text('Fallback'),
                                      ),
                                    );
                                  }
                                }),
                              );
                            }),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              SizedBox(
                height: 25,
              ),
              Text(
                'Time: $_seconds seconds',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 150,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    mainAxisSpacing: 6.0,
                    crossAxisSpacing: 6.0,
                  ),
                  itemCount: numbers.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ClipOval(
                        child: Draggable<int>(
                          data: numbers[index],
                          childWhenDragging: CircleAvatar(
                            backgroundColor: Colors.white,
                          ),
                          feedback: Material(
                            child: CircleAvatar(
                              backgroundColor: Colors.black,
                              child: Text(
                                numbers[index].toString(),
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          child: CircleAvatar(
                            backgroundColor: Colors.black,
                            child: Text(
                              numbers[index].toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        )));
  }

  @override
  void dispose() {
    _animationController1.dispose();
    _animationController2.dispose();
    _newTableAnimationController.dispose();
    _stopTimer();
    super.dispose();
  }
}
