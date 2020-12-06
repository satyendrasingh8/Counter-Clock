import 'package:CountDown_Timer/alarm_page.dart';
import 'package:CountDown_Timer/clock_page.dart';
import 'package:CountDown_Timer/data.dart';
import 'package:CountDown_Timer/enums.dart';
import 'package:CountDown_Timer/menu_info.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formattedTime = DateFormat('HH:mm').format(now);
    var formattedData = DateFormat('EEE, d MMM').format(now);
    var timezoneString = now.timeZoneOffset.toString().split('.').first;
    var offsetSign = '';
    if (!timezoneString.startsWith('-')) offsetSign = '+';

    print(timezoneString);
    return Scaffold(
      backgroundColor: Color(0xFF2D2F41),
      body: Row(
        children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: menuItems
                  .map((currentMenuInfo) => buildMenuButton(currentMenuInfo))
                  .toList()),
          VerticalDivider(
            color: Colors.white54,
            width: 1,
          ),
          Expanded(
            child: Consumer<MenuInfo>(
              builder: (BuildContext context, MenuInfo value, Widget child) {
                if (value.menuType == MenuType.clock)
                  return ClockPage(
                      formattedTime: formattedTime,
                      formattedData: formattedData,
                      offsetSign: offsetSign,
                      timezoneString: timezoneString);
                else if (value.menuType == MenuType.alarm)
                  return AlarmPage();
                else
                 return Center(
                    child: Text('other features'),
                  );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMenuButton(MenuInfo currentMenuInfo) {
    return Consumer<MenuInfo>(
        builder: (BuildContext context, MenuInfo value, Widget child) {
      return FlatButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topRight: Radius.circular(32))),
          color: currentMenuInfo.menuType == value.menuType
              ? Color(0xFF242634)
              : Colors.transparent,
          onPressed: () {
            var menuInfo = Provider.of<MenuInfo>(context, listen: false);
            menuInfo.updateMenu(currentMenuInfo);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Column(
              children: [
                Image.asset(
                  currentMenuInfo.imageSource,
                  scale: 1.5,
                ),
                Text(
                  currentMenuInfo.title ?? '',
                  style: TextStyle(
                      fontFamily: 'avenir', color: Colors.white, fontSize: 14),
                ),
              ],
            ),
          ));
    });
  }
}
