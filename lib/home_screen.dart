import 'dart:math';
import 'package:bmi_calculator/height_weight_widget.dart';
import 'package:bmi_calculator/score_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pretty_gauge/pretty_gauge.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _gender = 0;
  int _height = 150;
  int _age = 30;
  int _weight = 50;
  bool _isFinished = false;
  double _bmiScore = 15.0;
  
  String? _bmiStatus;

  String? _bmiInterpretation;

  Color? _bmiStatusColor;

  @override
  Widget build(BuildContext context) {
    setBmiInterpretation();
    return Scaffold(
        appBar: AppBar(
          backgroundColor:const Color.fromARGB(255, 5, 41, 104),
          centerTitle: true,
          title: const Text("BMI"),
          actions:[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:8.0),
              child: Row(
                children: const[
                  Icon(Icons.bar_chart),
                  SizedBox(width: 10,),
                   Icon(Icons.chat_bubble_outline)
                ],
              ),
            ),
           
          ]
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(12),
            child: Card(
              elevation: 12,
              shape: const RoundedRectangleBorder(),
              child: Column(
                children: [
                          PrettyGauge(
                      gaugeSize: 250,
                      minValue: 15,
                      maxValue: 40,
                      segments: [
                        GaugeSegment('UnderWeight', 1, Color.fromARGB(255, 68, 169, 194)),
                        GaugeSegment('Normal',2.5, Color.fromARGB(255, 66, 109, 165)),
                        GaugeSegment('OverWeight', 6.5, Color.fromARGB(255, 63, 240, 78)),
                        GaugeSegment('Obese', 5, Color.fromARGB(255, 145, 192, 92)),
                         GaugeSegment('Obese', 5, Color.fromARGB(255, 241, 103, 48)),
                          GaugeSegment('Obese', 5, Color.fromARGB(255, 230, 52, 111)),
                      ],
                      valueWidget: Text(
                        _bmiScore.toStringAsFixed(1),
                        style: const TextStyle(fontSize: 40),
                      ),
                      currentValue: _bmiScore.toDouble(),
                      needleColor: Colors.blue,
                    ),
                  
                    Text(
                      _bmiStatus!,
                      style: TextStyle(fontSize: 20, color: _bmiStatusColor!),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      _bmiInterpretation!,
                      style: const TextStyle(fontSize: 15,color: Colors.blue),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  HeightWidget(
                    onChange1:(weightVal) {
                            _weight = weightVal;
                          },
                    onChange: (heightVal) {
                      _height = heightVal;
                    }, initValue: 50,
                    max: 200,
                    min: 0,
                    title1:'Height',
                    title: 'Weight',
                  ),
             
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 60),
                    child: SwipeableButtonView(
                        isFinished: _isFinished,
                        onFinish: () async {
                          await Navigator.push(
                              context,
                              PageTransition(
                                  child: ScoreScreen(
                                    bmiScore: _bmiScore,
                                    age: _age,
                                  ),
                                  type: PageTransitionType.fade));

                          setState(() {
                            _isFinished = false;
                          });
                        },
                        onWaitingProcess: () {
                          //Calculate BMI here
                          calculateBmi();

                          Future.delayed(Duration(seconds: 1), () {
                            setState(() {
                              _isFinished = true;
                            });
                          });
                        },
                        activeColor: Colors.blue,
                        buttonWidget: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.black,
                        ),
                        buttonText: "CALCULATE"),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  void calculateBmi() {
    _bmiScore = _weight / pow(_height / 100, 2);
  }

  void setBmiInterpretation() {
    if (_bmiScore > 30) {
      _bmiStatus = "Very severly obese";
      _bmiInterpretation = "Please work to reduce obesity";
      _bmiStatusColor =const Color.fromARGB(255, 230, 52, 111);
    } else if (_bmiScore > 30&&_bmiScore<=35) {
      _bmiStatus = "Obese";
      _bmiInterpretation = "Do regular exercise & reduce the weight";
      _bmiStatusColor =const Color.fromARGB(255, 241, 103, 48);
    } else if (_bmiScore >25&&_bmiScore<=30) {
      _bmiStatus = "Over Weight";
      _bmiInterpretation = "Do regular exercise & reduce the weight";
      _bmiStatusColor =const Color.fromARGB(255, 145, 192, 92);
    }
    else if (_bmiScore > 18.5&&_bmiScore<=25) {
      _bmiStatus = "Normal Weight";
      _bmiInterpretation = "You are in good shape!";
      _bmiStatusColor =const Color.fromARGB(255, 63, 240, 78);
    }
    else if (_bmiScore > 16&&_bmiScore<=18.5) {
      _bmiStatus = "Underweight";
      _bmiInterpretation = "Try to increase the weight";
      _bmiStatusColor =const Color.fromARGB(255, 66, 109, 165);
    } 
    
    else if (_bmiScore <= 16) {
      _bmiStatus = "Excessive Underweight";
      _bmiInterpretation = "Try to increase the weight";
      _bmiStatusColor =const Color.fromARGB(255, 68, 169, 194);
    }
  }

}
