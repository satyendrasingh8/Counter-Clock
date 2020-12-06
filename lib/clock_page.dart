import 'package:CountDown_Timer/clock_view.dart';
import 'package:flutter/material.dart';

class ClockPage extends StatelessWidget {
  const ClockPage({
    Key key,
    @required this.formattedTime,
    @required this.formattedData,
    @required this.offsetSign,
    @required this.timezoneString,
  }) : super(key: key);

  final String formattedTime;
  final String formattedData;
  final String offsetSign;
  final String timezoneString;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Text(
              'Clock',
              style: TextStyle(
                  fontFamily: 'avenir',
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontSize: 30),
            ),
          ),
          Flexible(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  formattedTime,
                  style: TextStyle(
                      fontFamily: 'avenir',
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 64),
                ),
                Text(
                  formattedData,
                  style: TextStyle(
                      fontFamily: 'avenir',
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 20),
                ),
              ],
            ),
          ),
          Flexible(
              flex: 4,
              fit: FlexFit.tight,
              child: Align(
                  alignment: Alignment.center,
                  child: ClockView(
                    size: MediaQuery.of(context).size.height / 4,
                  ))),
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Timezone',
                  style: TextStyle(
                      fontFamily: 'avenir',
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 24),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(
                      Icons.language,
                      color: Colors.white,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'UTC' + offsetSign + timezoneString,
                      style: TextStyle(
                          fontFamily: 'avenir',
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 24),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
