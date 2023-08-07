import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:flutter_3d_choice_chip/flutter_3d_choice_chip.dart';

class RollWidget extends StatefulWidget {
    final Function() onChange;


   int initValue;

  final int min;

  final int max;

   RollWidget({Key? key, required this.onChange,required this.initValue,required this.max,required this.min}) : super(key: key);

  @override
  _RollWidgetState createState() => _RollWidgetState();
}

class _RollWidgetState extends State<RollWidget> {
  int _height = 150;

 int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 15),
        
        NumberPicker(
          value: widget.initValue,
          minValue: widget.min,
          maxValue: widget.max,
          step: 10,
          haptics: true,
          onChanged: (value) => setState(() =>widget.initValue = value),
        ),
   
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     IconButton(
        //       icon: Icon(Icons.remove),
        //       onPressed: () => setState(() {
        //         final newValue = _currentIntValue - 10;
        //         _currentIntValue = newValue.clamp(0, 100);
        //       }),
        //     ),
        //     Text('Current int value: $_currentIntValue'),
        //     IconButton(
        //       icon: Icon(Icons.add),
        //       onPressed: () => setState(() {
        //         final newValue = _currentIntValue + 20;
        //         _currentIntValue = newValue.clamp(0, 100);
        //       }),
        //     ),
        //   ],
        // ),
     //   Divider(color: Colors.grey, height: 32),
     
       
        // NumberPicker(
        //   value: _currentHorizontalIntValue,
        //   minValue: 0,
        //   maxValue: 100,
        //   step: 10,
        //   itemHeight: 100,
        //   axis: Axis.horizontal,
        //   onChanged: (value) =>
        //       setState(() => _currentHorizontalIntValue = value),
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(16),
        //     border: Border.all(color: Colors.black26),
        //   ),
        // ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     IconButton(
        //       icon: Icon(Icons.remove),
        //       onPressed: () => setState(() {
        //         final newValue = _currentHorizontalIntValue - 10;
        //         _currentHorizontalIntValue = newValue.clamp(0, 100);
        //       }),
        //     ),
        //     Text('Current horizontal int value: $_currentHorizontalIntValue'),
        //     IconButton(
        //       icon: Icon(Icons.add),
        //       onPressed: () => setState(() {
        //         final newValue = _currentHorizontalIntValue + 20;
        //         _currentHorizontalIntValue = newValue.clamp(0, 100);
        //       }),
        //     ),
        //   ],
        // ),
      ],
    );
  }
}
