import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Sameer's Summary",
        ),
      ),
      body: Center(
        child: Container(
          child: Column(children: [
            _pieCharts(),
            _currentDayCompletedTasks(),
            _recommendedTasks(),
          ]),
        ),
      ),
    );
  }

  Widget _percentageCharts(String subject, double percentage) {
    //print(percentage);
    return CircularPercentIndicator(
        animationDuration: 2000,
        radius: 40.0,
        lineWidth: 6.0,
        progressColor: Colors.blue,
        percent: percentage,
        backgroundColor: Colors.grey.shade200,
        animateFromLastPercent: true,
        animation: true,
        circularStrokeCap: CircularStrokeCap.round,
        center: Text("$percentage%"));
  }

  Widget _pieCharts() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _percentageCharts("Fitness", 0.5),
          _percentageCharts("Sleep", 0.3),
          _percentageCharts("Diet", 0.7),
          _percentageCharts("Meds", 0.8)
        ],
      ),
    );
  }

  Widget _currentDayCompletedTasks() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15.0, top: 15.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Today",
              style:
                  const TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        _newTaskBox(90.0, Colors.orange)
      ],
    );
  }

  Widget _boxContents() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.only(left: 5.0),
            child: Icon(
              Icons.bike_scooter,
              color: Colors.orange,
            ),
          ),
          Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(top: 10.0),
              child: Text("Bike Ride",
                  style:
                      TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold))),
          Container(
            padding: EdgeInsets.only(right: 5.0),
            alignment: Alignment.centerRight,
            child: Text(
              "260 cal",
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }

  Widget _newTaskBox(double height, Color color) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Container(
        height: height,
        decoration: new BoxDecoration(
            boxShadow: [
              BoxShadow(
                  spreadRadius: 5,
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 7,
                  offset: Offset(0, 3))
            ],
            color: color,
            border: Border.all(color: Colors.black.withOpacity(0.3)),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            shape: BoxShape.rectangle),
        child: Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Container(
            decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                    topLeft: Radius.circular(7.5),
                    topRight: Radius.circular(7.5))),
            child: _boxContents(),
          ),
        ),
      ),
    );
  }

  Widget _recommendedTasks() {
    return Column(children: [
      Padding(
        child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Recommended",
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            )),
        padding: EdgeInsets.only(left: 15.0),
      ),
      _newTaskBox(100.0, Colors.blue.shade300)
    ]);
  }
}
