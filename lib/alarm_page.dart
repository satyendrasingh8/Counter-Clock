import 'package:CountDown_Timer/data.dart';
import 'package:CountDown_Timer/theme_data.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class AlarmPage extends StatefulWidget {
  @override
  _AlarmPageState createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32,vertical: 64),
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Alarm',
          style: TextStyle(
              fontFamily: 'avenir',
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: 30),
        ),
        Expanded(
                  child: ListView(
              children: alarms.map<Widget>((alarm) {
            return Container(
              margin: EdgeInsets.only(bottom: 30),
              padding: EdgeInsets.symmetric(horizontal: 19),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                colors: alarm.gradientColors,
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                
                ),
                boxShadow:[ BoxShadow(
                  color: alarm.gradientColors.last.withOpacity(0.4),
                  blurRadius: 8,
                  spreadRadius: 4,
                  offset: Offset(4,4)
                )],
                borderRadius: BorderRadius.all(Radius.circular(24)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   Row(
                     
                     children: [
                  Icon(Icons.label,
                    color: Colors.white,
                    size: 24,
                    ),
                    SizedBox(width: 8,),
                    Text('Office',
                    style: TextStyle(color: Colors.white,
                    fontFamily: 'avenir'
                    ),
                    ),
                   ],),
                    Switch(value: true,activeColor: Colors.white ,
                    onChanged: (bool value){}),
               
                  ],
               
                ),
             Text('Mon-Fri',
                    style: TextStyle(color: Colors.white,
                    fontFamily: 'avenir',
                     fontSize: 15,

                    ),
                    ),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text('07:00AM',
                    style: TextStyle(color: Colors.white,
                    fontFamily: 'avenir',
                    fontSize: 24,
                    fontWeight: FontWeight.w600

                    ),
                    ),
                    Icon(Icons.keyboard_arrow_down,
                    color: Colors.white,
                    size: 36,
                    )
                       ],
                     ),
              ],),
              
            );
          }).followedBy(
            [
              if(alarms.length<5)
              DottedBorder(
                strokeWidth: 3,
                color: CustomColors.clockOutline,
                borderType: BorderType.RRect,
                radius: Radius.circular(24),
                dashPattern: [5,4],
                              child: Container(
                   width: double.infinity,
                decoration: BoxDecoration(color: CustomColors.clockBG,
                borderRadius:
                 BorderRadius.all(Radius.circular(24))
                 ),
                
                  child: FlatButton(
                 padding: EdgeInsets.symmetric(horizontal: 32,vertical: 16),
                    onPressed: (){},
                         child: Column(children: [
                      Image.asset('assets/add_alarm.png',
                      scale: 1.5,
                      ),
                      SizedBox(height: 8,),
                       Text('Add Alarm',
                        style: TextStyle(color: Colors.white,
                        fontFamily: 'avenir',
                         fontSize: 15,

                        ),
                        ),
                    ],),
                  ),
                ),
              )
           else 
             Text('Only 5 alarms allowed!'),
            ]
          ).toList()),
        ),
      ],
    ));
  }
}
