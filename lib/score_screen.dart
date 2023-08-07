import 'package:flutter/material.dart';
import 'package:pretty_gauge/pretty_gauge.dart';
import 'package:share_plus/share_plus.dart';

class ScoreScreen extends StatelessWidget {
  final double bmiScore;

  final int age;

  String? bmiStatus;

  String? bmiInterpretation;

  Color? bmiStatusColor;

  List<Color> colorLists=[
const Color.fromARGB(255, 68, 169, 194),
const Color.fromARGB(255, 66, 109, 165),
const Color.fromARGB(255, 63, 240, 78),
const Color.fromARGB(255, 145, 192, 92),
const Color.fromARGB(255, 241, 103, 48),
const Color.fromARGB(255, 230, 52, 111)
  ] ;

  List<String>bmiStatusList=[
"Excessive Underweight",
"Underweight",
"Normal Weight",
"Over Weight",
 "Obese",
 "Very severly obese"
  ];

  List<String>weightList=[
"<53.5 kg",
"45.7-53.5 kg",
"53.5-72.3 kg",
"72.3-86.7 kg",
 "86.7-102.3 kg",
 "102.3-115.6 kg"
  ];

  ScoreScreen({Key? key, required this.bmiScore, required this.age})
      : super(key: key);

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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Your Score",
                        style: TextStyle(fontSize: 30, color: Colors.blue),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      PrettyGauge(
                        gaugeSize: 300,
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
                          bmiScore.toStringAsFixed(1),
                          style: const TextStyle(fontSize: 40),
                        ),
                        currentValue: bmiScore.toDouble(),
                        needleColor: Colors.blue,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        bmiStatus!,
                        style: TextStyle(fontSize: 20, color: bmiStatusColor!),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        bmiInterpretation!,
                        style: const TextStyle(fontSize: 15,color: Colors.blue),
                      ),
                    
                
                      const SizedBox(
                        height: 10,
                      ),
      
      ...List.generate(6,(index){
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
        Row(
          children: [
            CircleAvatar(radius: 8,backgroundColor: colorLists[index],),
            SizedBox(width: 10,),
            Text(bmiStatusList[index],style: const TextStyle(fontSize: 12),)
          ],
          
        ),
         Text(weightList[index],style: TextStyle(fontSize: 12),)
        ],),
      );
      }),
      
      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Re-calculate")),
                          const SizedBox(
                            width: 10,
                          ),
                          // ElevatedButton(
                          //     onPressed: () {
                          //       Share.share(
                          //           "Your BMI is ${bmiScore.toStringAsFixed(1)} at age $age");
                          //     },
                          //     child: const Text("Share")),
                        ],
                      )
                    ]))),
      ),
    );
  }

    void setBmiInterpretation() {
    if (bmiScore > 30) {
      bmiStatus = "Very severly obese";
      bmiInterpretation = "Please work to reduce obesity";
      bmiStatusColor =const Color.fromARGB(255, 230, 52, 111);
    } else if (bmiScore > 30&&bmiScore<=35) {
      bmiStatus = "Obese";
      bmiInterpretation = "Do regular exercise & reduce the weight";
      bmiStatusColor =const Color.fromARGB(255, 241, 103, 48);
    } else if (bmiScore >25&&bmiScore<=30) {
      bmiStatus = "Over Weight";
      bmiInterpretation = "Do regular exercise & reduce the weight";
      bmiStatusColor =const Color.fromARGB(255, 145, 192, 92);
    }
    else if (bmiScore > 18.5&&bmiScore<=25) {
      bmiStatus = "Normal Weight";
      bmiInterpretation = "You are in good shape!";
      bmiStatusColor =const Color.fromARGB(255, 63, 240, 78);
    }
    else if (bmiScore > 16&&bmiScore<=18.5) {
      bmiStatus = "Underweight";
      bmiInterpretation = "Try to increase the weight";
      bmiStatusColor =const Color.fromARGB(255, 66, 109, 165);
    } 
    
    else if (bmiScore <= 16) {
      bmiStatus = "Excessive Underweight";
      bmiInterpretation = "Try to increase the weight";
      bmiStatusColor =const Color.fromARGB(255, 68, 169, 194);
    }
  }
}
