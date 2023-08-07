import 'package:flutter/material.dart';
import 'package:bmi_calculator/roll_widget.dart';

class HeightWidget extends StatefulWidget {
   final Function(int) onChange;

   final Function(int) onChange1;

  final String title;

  final String title1;

  final int initValue;

  final int min;

  final int max;

  const HeightWidget({Key? key, required this.onChange,required this.onChange1,required this.initValue,required this.max,required this.min,required this.title,required this.title1}) : super(key: key);

  @override
  _HeightWidgetState createState() => _HeightWidgetState();
}

class _HeightWidgetState extends State<HeightWidget> {
  int _height = 150;

 int counter = 0;
initState(){
  super.initState();
   counter = widget.initValue;
}


  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
          elevation: 12,
          shape: const RoundedRectangleBorder(),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  
                 Text(
                  widget.title1,
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                
                   SizedBox(
                    width: 150,
                    child: Slider(
                      
                      min: 0,
                      max: 240,
                      value: _height.toDouble(),
                      thumbColor: Colors.red,
                      onChanged: (value) {
                        setState(() {
                          _height = value.toInt();
                        });
                        widget.onChange(_height);
                      },
                    ),
                  ),
                  TextButton(
                    onPressed: () => showAlertDialog(context, 'Height', () {Navigator.pop(context);},widget.onChange as Function()),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _height.toString(),
                          style: const TextStyle(fontSize: 14,color: Colors.blue),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "cm",
                          style: TextStyle(fontSize: 13, color: Colors.blue),
                        )
                      ],
                    ),
                  ),
               
                ],
              ),
               const    SizedBox(width: double.infinity, child: Divider(thickness: 1.0,color: Color.fromARGB(255, 211, 211, 211),)),
                 Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  
                 Text(
                widget.title,
                style: const TextStyle(fontSize: 14, color: Colors.black),
              ),
           
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    InkWell(
                      child: const CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.blue,
                        child: Icon(Icons.remove, color: Colors.white),
                      ),
                      onTap: () {
                        setState(() {
                          if (counter > widget.min) {
                            counter--;
                          }
                        });
                        widget.onChange1(counter);
                      },
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                
                  
                    InkWell(
                      child: const CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.blue,
                        child: Icon(Icons.add, color: Colors.white),
                      ),
                      onTap: () {
                        setState(() {
                          if (counter < widget.max) {
                            counter++;
                          }
                        });
                        widget.onChange1(counter);
                      },
                    ),
                  ],
                ),
              ),
                  TextButton(
                    onPressed: ()=>showAlertDialog(context, 'Weight', () {
                   Navigator.pop(context);
                     },widget.onChange1 as Function()),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                          Text(
                        counter.toString(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "Kg",
                          style: TextStyle(fontSize: 13, color: Colors.blue),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }

  showAlertDialog(
      BuildContext context, String description, VoidCallback onPress,Function() onChange) {
    // set up the button

    // Widget okButton = TextButton(
    //     child: Text(
    //       "OK",
    //       style: Theme.of(context)
    //           .textTheme
    //           .subtitle2!
    //           .copyWith( fontSize: 15),
    //     ),
    //     onPressed: onPress);

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Center(child: Text('Height')),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      content: SizedBox(
        height: 170,
        child:
            Column(
              children: [
                RollWidget(onChange:onChange,initValue: widget.initValue,max: widget.max,min: widget.min,),
             
          
              ],
            ),

      ),
      actions: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Container(
                        height: 40,
                      width: MediaQuery.of(context).size.width/3.5,
                        color: Colors.grey,
                        child:Center(child: Text('Cancel',style: TextStyle(color:Colors.white),)), 
                      ),
                    ),
              //    const  SizedBox(height:40, child: VerticalDivider(thickness: 1.0,)),
                       TextButton(
                        onPressed: onPress,
                         child: Container(
                          height: 40,
                                             width: MediaQuery.of(context).size.width/3.5,
                                             color: Colors.blue,
                                             child: const Center(child: Text('Save',style: TextStyle(color:Colors.white),)),
                                           ),
                       ),
                  ],
                )

      ],
      //The end
      
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

}
